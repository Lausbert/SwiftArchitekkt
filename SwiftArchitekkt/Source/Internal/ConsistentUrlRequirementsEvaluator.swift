//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct ConsistentUrlRequirementsEvaluator {

    // MARK: - Internal -

    enum ErrorEnum: LocalizedError, Equatable {
        case unexpectedlyCouldNotFindXcodeUrl

        var errorDescription: String? {
            switch self {
            case .unexpectedlyCouldNotFindXcodeUrl:
                return "Unexpectedly could not find Xcode url."
            }
        }

    }

    static let consistentUrlRequirements = [
        ConsistentUrlRequirement(key: "org.cocoapods.SwiftArchitekkt.Xcode.app", description: "Choose your Xcode app and related command line tools.", fileName: "Xcode", fileType: "app")
    ]

    static func getXcodeUrl(for graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> URL? {
        if let url = graphRequest.consistentlyRequiredUrls[consistentUrlRequirements[0]] {
            return url
        } else {
            completionHandler(.failure(graphRequest, ErrorEnum.unexpectedlyCouldNotFindXcodeUrl))
            return nil
        }
    }

}
