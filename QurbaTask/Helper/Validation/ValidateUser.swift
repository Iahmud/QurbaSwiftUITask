//
//  ValidateUser.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 18/03/2023.
//

import Foundation

class ValidateUser {
    
    
    static func isValidEmail(_ validateEmail:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        guard emailTest.evaluate(with: validateEmail) else {return false}
        return true
    }
    
    static func isemptyInput(_ validateCount:String?) -> Bool {
        
        guard validateCount != "",
              (validateCount?.trimmingCharacters(in: NSCharacterSet.whitespaces)) != ""
        else {return false}
        return true
    }
    
    static func isValidCountFor(validateCount:String,countCheck:Int) -> Bool {
        return validateCount.count >= countCheck
    }
    
    static func isValidCountequal(validateCount:String,countCheck:Int) -> Bool {
        return validateCount.count == countCheck
    }
    
    
}
