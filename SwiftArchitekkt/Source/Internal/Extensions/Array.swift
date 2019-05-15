//
//  Array.swift
//  SwiftArchitekkt
//
//  Created by Stephinsky on 04.09.18.
//  Copyright © 2018 StephanLerner. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {

    mutating func remove(element: Element, andFollowing following: Int = 0) {
        if let index = self.firstIndex(of: element) {
            for index in stride(from: index + following, through: index, by: -1) {
                guard self.indices.contains(index) else { continue }
                self.remove(at: index)
            }
        }
    }

}

extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}
