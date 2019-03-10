//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

extension XcodeBuildWrapper {

    // MARK: - Internal -

    /// Checks for missing parameters and adds them to the graph request, if their is just a single option. If their are no longer any parameters missing, an updated graph request is returned. If their are more than one options for a parameter, completion is invoked with a need for decision and nil is returned. If an error occurs completion is invoked with this error and nil is returned.
    ///
    /// - Parameters:
    ///   - graphRequest: A graph request
    ///   - completionHandler: Handles the need for decisions or occuring errors
    /// - Returns: An updated graph request, if any parameters were added. The initial graph request if no parameters are missing. Nil if an error occured or a decision is needed.
    static func update(graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> GraphRequest? {
        var updatedGraphRequest = graphRequest
        while let mostUrgentMissingParamter = XcodeBuildWrapper.mostUrgentMissingParameter(for: updatedGraphRequest) {
            do {
                let parameterOptions = try XcodeBuildWrapper.get(parameter: mostUrgentMissingParamter, for: updatedGraphRequest)
                if let options = parameterOptions[mostUrgentMissingParamter.rawValue], options.count == 1, let singleOption = options.first {
                    updatedGraphRequest = GraphRequest(url: updatedGraphRequest.url, options: updatedGraphRequest.options.merging([mostUrgentMissingParamter.rawValue: singleOption], uniquingKeysWith: { $1 }), accessibleUrls: updatedGraphRequest.accessibleUrls)
                } else {
                    completionHandler(GraphRequest.Result.decisionNeeded(updatedGraphRequest, parameterOptions))
                    return nil
                }
            } catch {
                completionHandler(GraphRequest.Result.failure(updatedGraphRequest, error))
                return nil
            }
        }
        return updatedGraphRequest
    }

    // MARK: - Private -

    private static func mostUrgentMissingParameter(for graphRequest: GraphRequest) -> ParameterEnum? {
        for parameter in ParameterEnum.allCases {
            if !graphRequest.options.keys.contains(parameter.rawValue) {
                return parameter
            }
        }
        return nil
    }

    private static func get(parameter: ParameterEnum, for graphRequest: GraphRequest) throws -> [GraphRequest.Parameter: [GraphRequest.Option]] {
        guard let fileExtension = SwiftFileExtension(rawValue: graphRequest.url.pathExtension) else { throw ErrorEnum.couldNotHandleFileExtension(graphRequest.url.pathExtension) }
        guard let accessibleUrl = graphRequest.accessibleUrls?.values.first else { throw ErrorEnum.unexpectedlyCouldNotFindAnyAccessibleUrl }
        let xcodeBuildUrl = accessibleUrl.appendingPathComponent("Contents/Developer/usr/bin/xcodebuild/")

        switch fileExtension {
        case .project:
            switch parameter {
            case .scheme:
                return try getProjectSchemes(for: graphRequest, xcodeBuildUrl: xcodeBuildUrl)
            case .target:
                return try getProjectTargets(for: graphRequest, xcodeBuildUrl: xcodeBuildUrl)
            }
        case .workspace:
            #warning("todo")
            return [:]
        }
    }

    private static func getProjectSchemes(for graphRequest: GraphRequest, xcodeBuildUrl: URL) throws -> [GraphRequest.Parameter: [GraphRequest.Option]] {
        guard let xcodeBuildResults = Shell.launch(path: xcodeBuildUrl.absoluteString, arguments: ["-list", "-project", graphRequest.url.absoluteString]) else { throw ErrorEnum.couldNotProperlyRunXcodeBuild }

        let schemeRegex = "Schemes:(\\n[ \\t]*[\\S]+)+"
        let schemeMatchingStrings = try Regex.getMatchingStrings(for: schemeRegex, text: xcodeBuildResults, captureGroup: 0)
        guard let schemes = schemeMatchingStrings.first?.replacingOccurrences(of: "Schemes:\n", with: "").replacingOccurrences(of: " ", with: "").components(separatedBy: "\n") else { throw ErrorEnum.couldNotFindAnySchemes(xcodeBuildResults) }

        return ["scheme": schemes]
    }

    private static func getProjectTargets(for graphRequest: GraphRequest, xcodeBuildUrl: URL) throws -> [GraphRequest.Parameter: [GraphRequest.Option]] {
        guard let scheme = graphRequest.options[ParameterEnum.scheme.rawValue] else { throw ErrorEnum.couldNotFindAnySchemes(graphRequest.options.description) }
        guard let xcodeBuildResults = Shell.launch(path: xcodeBuildUrl.absoluteString, arguments: ["-showBuildSettings", "-project", graphRequest.url.absoluteString, "-scheme", scheme]) else { throw ErrorEnum.couldNotProperlyRunXcodeBuild }

        let targetRegex = "TARGETNAME = ([\\S]+)"
        let targets = try Regex.getMatchingStrings(for: targetRegex, text: xcodeBuildResults, captureGroup: 1)
        guard targets.count > 0 else { throw ErrorEnum.couldNotFindAnyTargets(xcodeBuildResults) }

        return ["target": targets]
    }

}
