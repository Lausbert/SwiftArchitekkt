//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct XcodeBuildWrapper {
    
    // MARK: - Internal -
    
    enum SwiftFileExtension: String, CaseIterable {
        case project = "xcodeproj"
        case workspace = "xcworkspace"
    }
    
    enum ParameterEnum: String, CaseIterable {
        case scheme = "scheme"
        case target = "target"
    }
    
    enum ErrorEnum: LocalizedError, Equatable {
        case couldNotHandleFileExtension(String)
        case couldNotProperlyRunXcodeBuild
        case couldNotFindAnySchemes(String)
        case couldNotFindAnyTargets(String)
        case couldNotFindAnyCompileCommands(String)
        
        var errorDescription: String? {
            switch self {
            case .couldNotHandleFileExtension(let fileExtension):
                return "Could not handle file extension: \(fileExtension)"
            case .couldNotProperlyRunXcodeBuild:
                return "Could not properly run xcodebuild."
            case .couldNotFindAnySchemes(let description):
                return "Could not find any schemes: \(description)"
            case .couldNotFindAnyTargets(let description):
                return "Could not find any targets: \(description)"
            case .couldNotFindAnyCompileCommands(let xcodeBuildResults):
                return "Could not find any compile commands for specified target: \(xcodeBuildResults)"
            }
        }
        
    }
    
}
