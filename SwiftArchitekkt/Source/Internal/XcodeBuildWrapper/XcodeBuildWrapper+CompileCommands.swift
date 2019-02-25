//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

extension XcodeBuildWrapper {

    // MARK: - Internal -

    static func getCompileCommands(for graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> [String]? {
        do {
            return try getCompileCommands(for: graphRequest)
        } catch {
            os_log("%@", log: SwiftGraphRequestHandler.errorLog, type: .debug, error.localizedDescription)
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }

    // MARK: - Private -

    private static func getCompileCommands(for graphRequest: GraphRequest) throws -> [String] {
        guard let fileExtension = SwiftFileExtension(rawValue: graphRequest.url.pathExtension) else { throw ErrorEnum.couldNotHandleFileExtension(graphRequest.url.pathExtension) }

        switch fileExtension {
        case .project:
            let compileCommands = try getProjectCompileCommands(for: graphRequest)
            let updatedCompileCommands = update(compileCommands: compileCommands)
            return updatedCompileCommands
        case .workspace:
            #warning("todo")
            return []
        }
    }

    private static func getProjectCompileCommands(for graphRequest: GraphRequest) throws -> [String] {
        guard let scheme = graphRequest.options[ParameterEnum.scheme.rawValue] else { throw ErrorEnum.couldNotFindAnySchemes(graphRequest.options.description) }
        guard let target = graphRequest.options[ParameterEnum.target.rawValue] else { throw ErrorEnum.couldNotFindAnyTargets(graphRequest.options.description) }
        guard let xcodeBuildResults = Shell.launch(path: "/usr/bin/xcrun", arguments: ["xcodebuild", "-project", graphRequest.url.absoluteString, "-scheme", scheme, "-allowProvisioningUpdates", "clean", "build"]) else { throw ErrorEnum.couldNotProperlyRunXcodeBuild }

        let compileCommandsRegex = "/(swiftc +[^\\n]* -module-name +\(target.replacingOccurrences(of: " ", with: "_")) +[^\\n]*)"
        guard let compileCommandsMatchingString = try Regex.getMatchingStrings(for: compileCommandsRegex, text: xcodeBuildResults, captureGroup: 1).first else { throw ErrorEnum.couldNotFindAnyCompileCommands(xcodeBuildResults) }

        return compileCommandsMatchingString.replacingOccurrences(of: "\\ ", with: "SpacePlaceholder").components(separatedBy: " ").map { $0.replacingOccurrences(of: "SpacePlaceholder", with: " ") }
    }

    private static func update(compileCommands: [String]) -> [String] {
        var updatedCompileCommands = compileCommands
        updatedCompileCommands.remove(element: "-incremental", andFollowing: 0)
        updatedCompileCommands.remove(element: "-embed-bitcode-marker", andFollowing: 0)
        updatedCompileCommands.remove(element: "-emit-dependencies", andFollowing: 0)
        updatedCompileCommands.remove(element: "-emit-module", andFollowing: 2)
        updatedCompileCommands.remove(element: "-emit-objc-header", andFollowing: 2)
        updatedCompileCommands.remove(element: "-c", andFollowing: 0)
        updatedCompileCommands.remove(element: "-parseable-output", andFollowing: 0)
        updatedCompileCommands.append("-dump-ast")
        return updatedCompileCommands
    }

}
