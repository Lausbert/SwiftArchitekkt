//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

struct SwiftCompilerWrapper {

    // MARK: - Internal -
    
    typealias ModuleName = String
    typealias CompileCommand = String
    typealias Ast = String

    enum ErrorEnum: LocalizedError, Equatable {
        case couldNotProperlyRunSwiftCompiler
        case invalidAstFormat(String)

        var errorDescription: String? {
            switch self {
            case .couldNotProperlyRunSwiftCompiler:
                return "Could not properly run swift compiler."
            case .invalidAstFormat(let ast):
                return "AST has invalid format: \(ast)"
            }
        }
    }

    static func generateAsts(for compileCommands: [(ModuleName, [CompileCommand])], graphRequest: GraphRequest, xcodeUrl: URL, completionHandler: (GraphRequest.Result) -> Void) -> [(ModuleName, Ast)]? {
        do {
            let swiftUrl = xcodeUrl.appendingPathComponent("Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc/")
            return try compileCommands.map { compileCommand in
                var ast = try generateAst(for: compileCommand.1, swiftUrl: swiftUrl)
                if ast.first == "\n" {
                    ast.removeFirst()
                }
                guard ast.prefix(12) == "(source_file" && ast.suffix(1) == ")" else { throw ErrorEnum.invalidAstFormat(ast) }
                return (compileCommand.0, ast)
            }
        } catch {
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }

    // MARK: - Private -

    private static func generateAst(for compileCommands: [String], swiftUrl: URL) throws -> String {
        guard let ast = Shell.launch(path: swiftUrl.absoluteString, arguments: compileCommands) else { throw ErrorEnum.couldNotProperlyRunSwiftCompiler }
        return ast
    }

}
