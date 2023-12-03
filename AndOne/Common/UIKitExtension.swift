//
//  UIKitExtension.swift
//  AndOne
//
//  Created by Aldiyar Saken on 03.12.2023.
//

import Foundation

extension String{
    
    var isValidEmail: Bool{
        let emailRegEx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
        let emailTest =  NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
