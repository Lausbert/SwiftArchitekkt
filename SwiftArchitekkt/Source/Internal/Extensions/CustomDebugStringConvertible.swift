//
//  String.swift
//  SwiftArchitekkt
//
//  Created by Stephan Lerner on 22.02.20.
//

import Foundation

extension CustomDebugStringConvertible {
    var cleanedUpDebugDescription: String {
        return debugDescription.replacingOccurrences(of: "\"", with: "")
    }
}
