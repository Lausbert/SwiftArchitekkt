//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

extension XcodeBuildWrapper {

    // MARK: - Internal -
    
    typealias ModuleName = String
    typealias CompileCommand = String

    static func getCompileCommands(for graphRequest: GraphRequest, xcodeUrl: URL, completionHandler: (GraphRequest.Result) -> Void) -> [(ModuleName, [CompileCommand])]? {
        do {
            return try getCompileCommands(for: graphRequest, xcodeUrl: xcodeUrl)
        } catch {
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }

    // MARK: - Private -

    private static func getCompileCommands(for graphRequest: GraphRequest, xcodeUrl: URL) throws -> [(ModuleName, [CompileCommand])] {
        guard let fileExtension = SwiftFileExtension(rawValue: graphRequest.url.pathExtension) else { throw ErrorEnum.couldNotHandleFileExtension(graphRequest.url.pathExtension) }
        let xcodeBuildUrl = xcodeUrl.appendingPathComponent("Contents/Developer/usr/bin/xcodebuild/")

        switch fileExtension {
        case .project:
            let compileCommands = try getProjectCompileCommands(for: graphRequest, xcodeBuildUrl: xcodeBuildUrl)
            let updatedCompileCommands = update(compileCommands: compileCommands)
            return updatedCompileCommands
        case .workspace:
            #warning("todo")
            return []
        }
    }

    private static func getProjectCompileCommands(for graphRequest: GraphRequest, xcodeBuildUrl: URL) throws -> [(ModuleName, [CompileCommand])] {
        guard let scheme = graphRequest.options[ParameterEnum.scheme.rawValue] else { throw ErrorEnum.couldNotFindAnySchemes(graphRequest.options.description) }
        guard let xcodeBuildResults = Shell.launch(path: xcodeBuildUrl.absoluteString, arguments: ["-project", graphRequest.url.absoluteString, "-scheme", scheme, "-allowProvisioningUpdates", "clean", "build"]) else { throw ErrorEnum.couldNotProperlyRunXcodeBuild }
        let compileCommandsRegex = StaticString("/(swiftc[^\\n]* -module-name +([^ ]+) +[^\\n]*)")
        let combinedResults = Regex.getCombinedResult(for: compileCommandsRegex, text: xcodeBuildResults, captureGroups: 1, 2)
        guard combinedResults.count > 0 else { throw ErrorEnum.couldNotFindAnyCompileCommands(xcodeBuildResults) }
        guard combinedResults.map({ $0.results }).allSatisfy({ $0.count == 2 }) else { throw ErrorEnum.couldNotFindAnyCompileCommands(xcodeBuildResults) }
        return combinedResults.map { combinedResult in
            let moduleName = combinedResult.results[1].string
            // i hate people who name their classes, variables, functions, files or any other stuff $$$$$$SpacePlaceholder$$$$$$, lol
            let compileCommands = combinedResult.results[0].string.replacingOccurrences(of: "\\ ", with: "$$$$$$SpacePlaceholder$$$$$$").components(separatedBy: " ").map { $0.replacingOccurrences(of: "$$$$$$SpacePlaceholder$$$$$$", with: " ") }
            return (moduleName, compileCommands)
        }
    }

    private static func update(compileCommands: [(ModuleName, [CompileCommand])]) -> [(ModuleName, [CompileCommand])] {
        return compileCommands.map { compileCommand in
            let moduleName = compileCommand.0
            var updatedCompileCommand = compileCommand.1
            updatedCompileCommand.remove(element: "swiftc", andFollowing: 0)
            updatedCompileCommand.remove(element: "-incremental", andFollowing: 0)
            updatedCompileCommand.remove(element: "-embed-bitcode-marker", andFollowing: 0)
            updatedCompileCommand.remove(element: "-emit-dependencies", andFollowing: 0)
            updatedCompileCommand.remove(element: "-emit-module", andFollowing: 2)
            updatedCompileCommand.remove(element: "-emit-objc-header", andFollowing: 2)
            updatedCompileCommand.remove(element: "-c", andFollowing: 0)
            updatedCompileCommand.remove(element: "-parseable-output", andFollowing: 0)
            updatedCompileCommand.append("-dump-ast")
            return (moduleName, updatedCompileCommand)
        }
    }

}
