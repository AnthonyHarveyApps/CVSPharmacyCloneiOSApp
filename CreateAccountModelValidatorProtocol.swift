//
//  CreateAccountModelValidatorProtocol.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/7/22.
//

import Foundation


// This protocol is used so if I were to test other components that depend on the CreateAccountValidator,
// I could inject a mock CreateAccountValidator which returns defined values in order to keep the system under test isolated

protocol CreateAccountValidatorProtocol {
    
      func isFirstNameValid(firstName: String) -> Bool
      
      func isLastNameValid(lastName: String) -> Bool
      
      func isValidEmailFormat(email: String) -> Bool
    
      func isPasswordValid(password: String) -> Bool

}
