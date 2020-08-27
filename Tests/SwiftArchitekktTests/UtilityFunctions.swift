//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt

/// Creates a url for defined ressource file. The url references ressources in SwiftArchitekktTests bundle, if related file could be added to bundle. Otherwise it directly references ressources in Ressources folder within SwiftArchitekktTests project folder. This is the case for .xcodeproj and .xcworkspace files.
///
/// - Parameters:
///   - name: The file name
///   - pathExtension: The path extension
/// - Returns: A url related to defined file
func getUrlForRessourceFile(withName name: String, pathExtension: String) -> URL {
    let packageDirectory =  URL(fileURLWithPath: #file).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    return packageDirectory.appendingPathComponent("Resources/\(name)/\(name)").appendingPathExtension(pathExtension)
}

/// Compares a string with a pattern. Varying contents like paths or memory addresses could be expressed as "@@@" in the pattern.
///
/// - Parameters:
///   - string: A string, which should match a pattern
///   - pattern: A pattern, with "@@@" as placeholder for e.g. environment related paths or runtime related memory adresses
func XCTStringMatchesPattern(string: String, pattern: String) {
    // greatly improves debugging
    XCTStringsContainedInString(strings: pattern.replacingOccurrences(of: "@@@", with: " ").components(separatedBy: " "), string: string)

    var regex = pattern
    [("{", "\\{"), ("}", "\\}"), ("[", "\\["), ("]", "\\]"), ("?", "\\?"), ("(", "\\("), (")", "\\)"), ("\\n", "\\\\n"), ("\'", "\\'"), (".", "\\."), ("\"", "\\\""), ("*", "\\*"), ("/", "\\/"), ("@@@", "[\\s\\S]*")].forEach {
        regex = regex.replacingOccurrences(of: $0, with: $1)
    }
    do {
        guard let match = try Regex.getResult(for: regex, text: string, captureGroup: 0).first else {
            XCTFail()
            return
        }
        XCTAssertEqual(string, match.string)
    } catch {
        XCTFail("Could not extract pattern from \(string).")
        return
    }
}

func XCTStringsContainedInString(strings: [String], string: String) {
    for str in strings where !str.isEmpty {
        XCTAssert(string.contains(str), "Unexpected missing string: \(str)")
    }
}

extension String {

    func losslessComponents(beginningWith: String) -> [String] {
        self.components(separatedBy: beginningWith).enumerated().compactMap({ (tuple) -> String? in
            let (offset, string) = tuple
            if offset == 0 && !string.isEmpty && !self.starts(with: beginningWith) {
                return string
            }
            return string.isEmpty ? nil : beginningWith + string
        })
    }

}

extension Substring {

    var string: String {
        String(self)
    }

}
