//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct SwiftCompilerWrapper {

    // MARK: - Internal -
    
    struct Result {
        let moduleName: String
        let ast: String
        let warning: String?
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
                let ast = try generateAst(for: xcodeBuildResult.compileCommands, swiftUrl: swiftUrl).trimmingCharacters(in: .whitespacesAndNewlines)
                if ast.prefix(12) == "(source_file" && ast.suffix(1) == ")" {
                    return Result(moduleName: xcodeBuildResult.moduleName, ast: ast, warning: nil)
                } else {
                    let warning = ast.count > 22000 ?
                        "AST for \(xcodeBuildResult.moduleName) has invalid format: \(ast.prefix(10000))\n\n[...]\n\n\(ast.suffix(10000))" :
                        "AST for \(xcodeBuildResult.moduleName) has invalid format: \(ast)"
                    return Result(moduleName: xcodeBuildResult.moduleName, ast: "", warning: warning)
                }
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
