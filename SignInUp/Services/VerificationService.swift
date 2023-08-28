//
//  VerificationService.swift
//  SignInUp
//
//  Created by Dulin Gleb on 25.8.23..
//

import Foundation

enum strenghtPassword {
    case veryWeak
    case weak
    case notVeryWeak
    case notVeryStron
    case strong
}

class VerificationService {
    
    // must be sorted by stregngth
    static let strenghtPasswordRegexes: [Int: String] = [
        1: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$",
        2: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$",
        3: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$",
        4: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
    ]
    
    static func strenghtPassword(password: String) -> Int {
        for (index, passwordRegex) in strenghtPasswordRegexes.sorted(by: >) {
            if NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password) {
                return index
            }
        }
        
        return 0
    }
    
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isRepeatedPassword(password1: String, password2: String) -> Bool {
        return password1 == password2
    }
}
