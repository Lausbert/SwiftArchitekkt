//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

extension XcodeBuildWrapper {

    // MARK: - Internal -

    /// Checks for missing parameters and adds them to the node request, if their is just a single option. If their are no longer any parameters missing, an updated node request is returned. If their are more than one options for a parameter, completion is invoked with a need for decision and nil is returned. If an error occurs completion is invoked with this error and nil is returned.
    ///
    /// - Parameters:
    ///   - nodeRequest: A node request
    ///   - completionHandler: Handles the need for decisions or occuring errors
    /// - Returns: An updated node request, if any parameters were added. The initial node request if no parameters are missing. Nil if an error occured or a decision is needed.
    static func update(nodeRequest: NodeRequest, xcodeUrl: URL, completionHandler: (NodeRequest.Result) -> Void) -> NodeRequest? {
        var updatedNodeRequest = nodeRequest
        while let mostUrgentMissingParamter = XcodeBuildWrapper.mostUrgentMissingParameter(for: updatedNodeRequest) {
            do {
                let parameterOptions = try XcodeBuildWrapper.get(parameter: mostUrgentMissingParamter, for: updatedNodeRequest, xcodeUrl: xcodeUrl)
                if parameterOptions.1.count == 1, let singleOption = parameterOptions.1.first {
                    updatedNodeRequest = NodeRequest(url: updatedNodeRequest.url, options: updatedNodeRequest.options.merging([mostUrgentMissingParamter.rawValue: singleOption], uniquingKeysWith: { $1 }), consistentlyRequiredUrls: updatedNodeRequest.consistentlyRequiredUrls)
                } else {
                    completionHandler(NodeRequest.Result.decisionNeeded(updatedNodeRequest, parameterOptions))
                    return nil
                }
            } catch {
                completionHandler(NodeRequest.Result.failure(updatedNodeRequest, error))
                return nil
            }
        }
        return updatedNodeRequest
    }

    // MARK: - Private -

    private static func mostUrgentMissingParameter(for nodeRequest: NodeRequest) -> ParameterEnum? {
        for parameter in ParameterEnum.allCases {
            if !nodeRequest.options.keys.contains(parameter.rawValue) {
                return parameter
            }
        }
        return nil
    }

    private static func get(parameter: ParameterEnum, for nodeRequest: NodeRequest, xcodeUrl: URL) throws -> (NodeRequest.Parameter, [NodeRequest.Option]) {
        let xcodeBuildUrl = xcodeUrl.appendingPathComponent("Contents/Developer/usr/bin/xcodebuild/")

        switch parameter {
        case .scheme:
            return try getSchemes(for: nodeRequest, xcodeBuildUrl: xcodeBuildUrl)
        }
    }

    private static func getSchemes(for nodeRequest: NodeRequest, xcodeBuildUrl: URL) throws -> (NodeRequest.Parameter, [NodeRequest.Option]) {
        guard let fileExtension = SwiftFileExtension(rawValue: nodeRequest.url.pathExtension) else { throw ErrorEnum.couldNotHandleFileExtension(nodeRequest.url.pathExtension) }
        guard let xcodeBuildResults = Shell.launch(path: xcodeBuildUrl.absoluteString, arguments: ["-list", fileExtension.xcodeBuildCommand, nodeRequest.url.absoluteString]) else { throw ErrorEnum.couldNotProperlyRunXcodeBuild }

        let schemeRegex = "Schemes:\\n((.+\\n)+)"
        let schemeResults = try Regex.getResult(for: schemeRegex, text: xcodeBuildResults, captureGroup: 1)
        guard let schemes = schemeResults
            .first?
            .string
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: "\n")
            .map({ $0.trimmingCharacters(in: .whitespacesAndNewlines) })
            else { throw ErrorEnum.couldNotFindAnySchemes(xcodeBuildResults) }
        return ("scheme", schemes)
    }

}
