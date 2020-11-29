//
//  Array+Only.swift
//  Memorize
//
//  Created by Max Zhang on 11/21/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
