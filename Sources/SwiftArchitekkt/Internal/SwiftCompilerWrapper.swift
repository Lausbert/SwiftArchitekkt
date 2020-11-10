//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct SwiftCompilerWrapper {

    // MARK: - Internal -
    
    struct Result {
        let moduleName: String
        let ast: String
    }

    enum ErrorEnum: LocalizedError, Equatable {
        case couldNotProperlyRunSwiftCompiler

        var errorDescription: String? {
            switch self {
            case .couldNotProperlyRunSwiftCompiler:
                return "Could not properly run swift compiler."
            }
        }
    }

    static func generateSwiftCompilerResults(for xcodeBuildResults: [XcodeBuildWrapper.Result], nodeRequest: NodeRequest, xcodeUrl: URL, completionHandler: (NodeRequest.Result) -> Void) -> [Result]? {
        do {
            let swiftUrl = xcodeUrl.appendingPathComponent("Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc/")
            return try xcodeBuildResults.map { xcodeBuildResult in
                var ast = try generateAst(for: xcodeBuildResult.compileCommands, swiftUrl: swiftUrl)
                if ast.first == "\n" {
                    ast.removeFirst()
                }
                return Result(moduleName: xcodeBuildResult.moduleName, ast: ast)
            }
        } catch {
            completionHandler(NodeRequest.Result.failure(nodeRequest, error))
            return nil
        }
    }

    // MARK: - Private -

    private static func generateAst(for compileCommands: [String], swiftUrl: URL) throws -> String {
        guard let ast = Shell.launch(path: swiftUrl.absoluteString, arguments: compileCommands) else { throw ErrorEnum.couldNotProperlyRunSwiftCompiler }
        return ast
    }

}
