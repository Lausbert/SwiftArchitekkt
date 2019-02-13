//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

// MARK: - Internal -

struct SwiftCompilerWrapper {
    
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
        
    static func generateAst(for compileCommands: [String], graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> String? {
        do {
            var ast = try generateAst(for: compileCommands)
            if ast.first == "\n" {
                ast.removeFirst()
            }
            guard ast.prefix(12) == "(source_file" && ast.suffix(1) == ")" else { throw ErrorEnum.invalidAstFormat(ast) }
            return ast
        } catch {
            os_log("%@", log: SwiftGraphRequestHandler.errorLog, type: .debug, error.localizedDescription)
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }
    
    // MARK: - Private -
    
    private static func generateAst(for compileCommands: [String]) throws -> String {
        guard let ast = Shell.launch(path: "/usr/bin/xcrun", arguments: compileCommands) else { throw ErrorEnum.couldNotProperlyRunSwiftCompiler }
        return ast
    }
    
}
