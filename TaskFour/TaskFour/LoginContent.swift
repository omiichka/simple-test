//
//  LoginContent.swift
//  TaskFour
//
//  Created by Artem Golovanev on 6/17/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import Foundation

final class LoginContent: NSObject {
    
    private enum Lenght {
        static let minLenth = 3
        static let maxLenth = 32
    }
    
    private var content: String = ""
    
    var isValid: Bool {
        let isLenghtValid = content.count >= Lenght.minLenth && content.count <= Lenght.maxLenth
        return !content.isInvalidChar && isLenghtValid
    }
    
    init(with content: String? = nil) {
        guard let content = content else { return }
        self.content = content
    }
    
    func setContent(_ text: String) {
        content = text
    }
}
