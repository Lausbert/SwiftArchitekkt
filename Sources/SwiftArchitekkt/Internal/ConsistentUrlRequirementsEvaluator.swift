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
        ConsistentUrlRequirement(key: "org.cocoapods.SwiftArchitekkt.Xcode.app", hint: "Choose your Xcode.app first. It is probably located in your applications folder. You can change it later in your preferences.", fileName: "Xcode", fileType: "app")
    ]

    static func getXcodeUrl(for nodeRequest: NodeRequest, completionHandler: (NodeRequest.Result) -> Void) -> URL? {
        if let url = nodeRequest.consistentlyRequiredUrls[consistentUrlRequirements[0]] {
            return url
        } else {
            completionHandler(.failure(nodeRequest, ErrorEnum.unexpectedlyCouldNotFindXcodeUrl))
            return nil
        }
    }

}
