//
//  CreateAccountModelValidator.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/7/22.
//

import Foundation


class CreateAccountModelValidator: CreateAccountValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
       return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        
        if password.count < SignupConstants.passwordMinLength ||
        password.count > SignupConstants.passwordMaxLength {
            print("too long or short")
            return false
        }
        
        if password.lowercased().contains("password") {
            print("contsainsPW")
            return false
        }
        
        if NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9]).{8,}$").evaluate(with: password) {
            print("Password has a letter and a number")
            
        } else {
            print("letter number issue")
            return false
        }

        return true
    }

    
}
