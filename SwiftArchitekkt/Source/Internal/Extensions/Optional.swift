//
//  String.swift
//  SwiftArchitekkt
//
//  Created by Stephan Lerner on 22.02.20.
//

import Foundation

extension Optional where Wrapped == String {
    init?(data: Data?, encoding: String.Encoding) {
        if let data = data {
            self = String.init(data: data, encoding: encoding)
        } else {
            self = nil
        }
    }
}
