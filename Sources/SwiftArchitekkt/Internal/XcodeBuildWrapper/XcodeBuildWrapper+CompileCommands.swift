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
        let xcodeBuildUrl = xcodeUrl.appendingPathComponent("Contents/Developer/usr/bin/xcodebuild/")
        let initialCompileCommands = try getInitialCompileCommands(for: graphRequest, xcodeBuildUrl: xcodeBuildUrl)
        let updatedCompileCommands = update(compileCommands: initialCompileCommands)
        return updatedCompileCommands
    }

    private static func getInitialCompileCommands(for graphRequest: GraphRequest, xcodeBuildUrl: URL) throws -> [(ModuleName, [CompileCommand])] {
        guard let fileExtension = SwiftFileExtension(rawValue: graphRequest.url.pathExtension) else { throw ErrorEnum.couldNotHandleFileExtension(graphRequest.url.pathExtension) }
        guard let scheme = graphRequest.options[ParameterEnum.scheme.rawValue] else {
            throw ErrorEnum.couldNotFindAnySchemes(graphRequest.options.description) }
        guard let xcodeBuildResults = Shell.launch(path: xcodeBuildUrl.absoluteString, arguments: [fileExtension.xcodeBuildCommand, graphRequest.url.absoluteString, "-scheme", scheme, "-allowProvisioningUpdates", "clean", "build"]) else {
            throw ErrorEnum.couldNotProperlyRunXcodeBuild
        }
        let compileCommandsRegex = StaticString("CompileSwiftSources normal ([^ ]+) com.apple.xcode.tools.swift.compiler [\\s\\S]*?/(swiftc[^\\n]* -module-name +([^ ]+) +[^\\n]*)")
        let combinedResults = Regex.getCombinedResult(for: compileCommandsRegex, text: xcodeBuildResults, captureGroups: 1, 2, 3)
        guard combinedResults.count > 0 else {
            throw ErrorEnum.couldNotFindAnyCompileCommands(xcodeBuildResults)
        }
        guard combinedResults.map({ $0.results }).allSatisfy({ $0.count == 3 }) else {
            throw ErrorEnum.couldNotFindAnyCompileCommands(xcodeBuildResults)
        }
        guard let targetArchitecture = combinedResults.last?.results.first?.string else {
            throw ErrorEnum.couldNotFindTargetArchitecture(xcodeBuildResults)
        }
        return combinedResults.compactMap { combinedResult in
            guard combinedResult.results[0].string == targetArchitecture else {
                return nil
            }
            let moduleName = combinedResult.results[2].string
            let compileCommands = combinedResult.results[1].string
                // fix weird escaped equal sign in build logs > enforce-exclusivity\\=checked and so on
                .replacingOccurrences(of: "\\=", with: "=")
                // i hate people who name their classes, variables, functions, files or any other stuff $$$$$$SpacePlaceholder$$$$$$, lol
                .replacingOccurrences(of: "\\ ", with: "$$$$$$SpacePlaceholder$$$$$$")
                .components(separatedBy: " ")
                .map { $0.replacingOccurrences(of: "$$$$$$SpacePlaceholder$$$$$$", with: " ") }
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
