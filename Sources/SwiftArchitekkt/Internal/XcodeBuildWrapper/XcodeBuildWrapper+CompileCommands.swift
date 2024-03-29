//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

extension XcodeBuildWrapper {

    // MARK: - Internal -

    struct Result {
        let moduleName: String
        let compileCommands: [String]
    }

    static func getXcodeBuildResults(for nodeRequest: NodeRequest, xcodeUrl: URL, completionHandler: (NodeRequest.Result) -> Void) -> [Result]? {
        do {
            return try getXcodeBuildResults(for: nodeRequest, xcodeUrl: xcodeUrl)
        } catch {
            completionHandler(NodeRequest.Result.failure(nodeRequest, error))
            return nil
        }
    }

    // MARK: - Private -

    private static func getXcodeBuildResults(for nodeRequest: NodeRequest, xcodeUrl: URL) throws -> [Result] {
        let xcodeBuildUrl = xcodeUrl.appendingPathComponent("Contents/Developer/usr/bin/xcodebuild/")
        let results = try getInitialCompileCommands(for: nodeRequest, xcodeBuildUrl: xcodeBuildUrl)
        let updatedResults = update(results: results)
        return updatedResults
    }

    private static func getInitialCompileCommands(for nodeRequest: NodeRequest, xcodeBuildUrl: URL) throws -> [Result] {
        guard let fileExtension = SwiftFileExtension(rawValue: nodeRequest.url.pathExtension) else { throw ErrorEnum.couldNotHandleFileExtension(nodeRequest.url.pathExtension) }
        guard let scheme = nodeRequest.options[ParameterEnum.scheme.rawValue] else {
            throw ErrorEnum.couldNotFindAnySchemes(nodeRequest.options.description) }
        guard let xcodeBuildResults = Shell.launch(path: xcodeBuildUrl.absoluteString, arguments: [fileExtension.xcodeBuildCommand, nodeRequest.url.absoluteString, "-scheme", scheme, "-allowProvisioningUpdates", "clean", "build"]) else {
            throw ErrorEnum.couldNotProperlyRunXcodeBuild
        }
        guard xcodeBuildResults.contains("** BUILD SUCCEEDED **") else {
            throw ErrorEnum.buildFailed(xcodeBuildResults)
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
            return Result(moduleName: moduleName, compileCommands: compileCommands)
        }
    }

    private static func update(results: [Result]) -> [Result] {
        return results.map { result in
            var updatedCompileCommands = result.compileCommands
            updatedCompileCommands.remove(element: "swiftc", andFollowing: 0)
            updatedCompileCommands.remove(element: "-incremental", andFollowing: 0)
            updatedCompileCommands.remove(element: "-embed-bitcode-marker", andFollowing: 0)
            updatedCompileCommands.remove(element: "-emit-dependencies", andFollowing: 0)
            updatedCompileCommands.remove(element: "-emit-module", andFollowing: 2)
            updatedCompileCommands.remove(element: "-emit-objc-header", andFollowing: 2)
            updatedCompileCommands.remove(element: "-c", andFollowing: 0)
            updatedCompileCommands.remove(element: "-parseable-output", andFollowing: 0)
            updatedCompileCommands.append("-dump-ast")
            return Result(moduleName: result.moduleName, compileCommands: updatedCompileCommands)
        }
    }

}
