//
//  Extension + String.swift
//  TaskFour
//
//  Created by Artem Golovanev on 6/17/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import Foundation

extension String {
    
    var isInvalidChar: Bool {
        let firstChar = prefix(1)
        return firstChar == "." || firstChar == "-" || Int(firstChar) != .none
    }
}
