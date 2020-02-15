//
//  Regex.swift
//  Nimble
//
//  Created by Stephan Lerner on 27.05.18.
//

import Foundation

public struct Regex {
    
    // MARK: - Private -
    
    public static func getMachingStrings(for match: NSTextCheckingResult, text: String, captureGroups: [Int]) -> [String] {
        let matchingStrings = captureGroups
            .compactMap { captureGroup in
                Range(match.range(at: captureGroup), in: text).map({String(text[$0])})
            }
        assert(matchingStrings.allSatisfy { !$0.isEmpty })
        assert(matchingStrings.count == captureGroups.count)
        return matchingStrings
    }

    // MARK: - Public -

    public static func getMatches(for regex: String, text: String) throws -> [NSTextCheckingResult] {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        return regex.matches(in: text, options: [], range: NSRange(text.startIndex..., in: text))
    }

    public static func getMatchingStrings(for regex: String, text: String, captureGroups: [Int]) throws -> [[String]] {
        let matches = try getMatches(for: regex, text: text)
        return matches.map { match in
            getMachingStrings(for: match, text: text, captureGroups: captureGroups)
        }
    }
    
    public static func getMatchingStrings(for regex: String, text: String, captureGroup: Int) throws -> [String] {
        try getMatchingStrings(for: regex, text: text, captureGroups: [captureGroup]).first ?? []
    }
    
    public static func getMatches(for regex: StaticString, text: String) -> [NSTextCheckingResult] {
        try! getMatches(for: "\(regex)", text: text)
    }

    public static func getMatchingStrings(for regex: StaticString, text: String, captureGroups: [Int]) -> [[String]] {
        try! getMatchingStrings(for: "\(regex)", text: text, captureGroups: captureGroups)
    }
    
    public static func getMatchingStrings(for regex: StaticString, text: String, captureGroup: Int) -> [String] {
        try! getMatchingStrings(for: "\(regex)", text: text, captureGroups: [captureGroup]).first ?? []
    }

}
