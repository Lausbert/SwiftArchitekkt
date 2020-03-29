//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct XcodeBuildWrapper {

    // MARK: - Internal -

    enum SwiftFileExtension: String, CaseIterable {
        case project = "xcodeproj"
        case workspace = "xcworkspace"
        
        var xcodeBuildCommand: String {
            switch self {
            case .project: return "-project"
            case .workspace: return "-workspace"
            }
        }
    }

    enum ParameterEnum: String, CaseIterable {
        case scheme
    }

    enum ErrorEnum: LocalizedError, Equatable {
        case couldNotHandleFileExtension(String)
        case couldNotProperlyRunXcodeBuild
        case couldNotFindAnySchemes(String)
        case couldNotFindAnyCompileCommands(String)
        case couldNotFindTargetArchitecture(String)

        var errorDescription: String? {
            switch self {
            case .couldNotHandleFileExtension(let fileExtension):
                return "Could not handle file extension: \(fileExtension)"
            case .couldNotProperlyRunXcodeBuild:
                return "Could not properly run xcodebuild."
            case .couldNotFindAnySchemes(let description):
                return "Could not find any schemes: \(description)"
            case .couldNotFindAnyCompileCommands(let xcodeBuildResults):
                return "Could not find any compile commands: \(xcodeBuildResults)"
            case .couldNotFindTargetArchitecture(let xcodeBuildResults):
                return "Could not find any target architecture: \(xcodeBuildResults)"
            }
        }

    }

}
