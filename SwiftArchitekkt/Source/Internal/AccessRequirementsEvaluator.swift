//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

struct AccessRequirementsEvaluator {
    
    // MARK: - Internal -
    
    enum ErrorEnum: LocalizedError, Equatable {
        
        case couldNotFindAnyAccessibleUrls
        case accessibleUrlDoesNotMatchRequirement
        case accessDeniedForAccessibleUrl
        
        var errorDescription: String? {
            switch self {
            case .couldNotFindAnyAccessibleUrls:
                return "Could not find any accessible urls."
            case .accessibleUrlDoesNotMatchRequirement:
                return "Accessible url does not match requirement."
            case .accessDeniedForAccessibleUrl:
                return "Access denied for accessible url."
            }
        }
    }
    
    static public let accessRequirements = [
        AccessRequirement(key: "SwiftGraphRequestHandler", description: "Choose your Xcode app and relate command line tools.", fileName: "Xcode", fileType: "app")
    ]
    
    static func evaluateAndStartAccessFor(graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> URL? {
        do {
            let accessibleUrl = try evaluateAccessFor(graphRequest: graphRequest)
            guard accessibleUrl.startAccessingSecurityScopedResource() else { throw ErrorEnum.accessDeniedForAccessibleUrl }
            return accessibleUrl
        } catch {
            os_log("%@", log: SwiftGraphRequestHandler.errorLog, type: .debug, error.localizedDescription)
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }
    
    // MARK: - Private -
    
    private static func evaluateAccessFor(graphRequest: GraphRequest) throws -> URL {
        let accessRequirement = accessRequirements[0]
        guard let accessibleUrls = graphRequest.accessibleUrls, !accessibleUrls.isEmpty else { throw ErrorEnum.couldNotFindAnyAccessibleUrls }
        guard let accessibleUrl = accessibleUrls[accessRequirement] else { throw ErrorEnum.accessibleUrlDoesNotMatchRequirement }
        return accessibleUrl
    }
        
}
