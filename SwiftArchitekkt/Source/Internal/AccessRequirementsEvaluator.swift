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

    static let accessRequirements = [
        AccessRequirement(key: "org.cocoapods.SwiftArchitekkt.Xcode.app", description: "Choose your Xcode app and related command line tools.", fileName: "Xcode", fileType: "app"),
        AccessRequirement(key: nil, description: "Choose project directory which (recursively) contains all needed source files.", fileName: nil, fileType: nil)
    ]

    static func evaluateAndStartAccessFor(graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> Bool {
        do {
            let urls = try evaluateAccessFor(graphRequest: graphRequest)
            for url in urls {
                guard url.startAccessingSecurityScopedResource() else { throw ErrorEnum.accessDeniedForAccessibleUrl }
            }
            return true
        } catch {
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return false
        }
    }

    static func stopAccessFor(graphRequest: GraphRequest) {
        graphRequest.accessibleUrls?.values.forEach { $0.stopAccessingSecurityScopedResource() }
    }

    // MARK: - Private -

    private static func evaluateAccessFor(graphRequest: GraphRequest) throws -> [URL] {
        guard let accessibleUrls = graphRequest.accessibleUrls, !accessibleUrls.isEmpty else { throw ErrorEnum.couldNotFindAnyAccessibleUrls }
        var urls: [URL] = []
        for accessRequirement in accessRequirements {
            guard let url = accessibleUrls[accessRequirement] else { throw ErrorEnum.accessibleUrlDoesNotMatchRequirement }
            urls.append(url)
        }
        return urls
    }

}
