//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

struct SwiftCompilerWrapper {

    // MARK: - Internal -

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

    static func generateAst(for compileCommands: [String], graphRequest: GraphRequest, xcodeUrl: URL, completionHandler: (GraphRequest.Result) -> Void) -> String? {
        do {
            let swiftUrl = xcodeUrl.appendingPathComponent("Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc/")
            var ast = try generateAst(for: compileCommands, swiftUrl: swiftUrl)
            if ast.first == "\n" {
                ast.removeFirst()
            }
            guard ast.prefix(12) == "(source_file" && ast.suffix(1) == ")" else { throw ErrorEnum.invalidAstFormat(ast) }
            return ast
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
