//
//  CVS_CloneTests.swift
//  CVS CloneTests
//
//  Created by Anthony Harvey on 3/1/22.
//

import XCTest
@testable import CVS_Clone

class CreateAccountModelValidatorTests: XCTestCase {

    var sut: CreateAccountModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // Arrange
        sut = CreateAccountModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testCreateAccountModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        //Act
        let isEmailValid = sut.isValidEmailFormat(email: "MyEmail@gmail.com")

        //Assert
        XCTAssertTrue(isEmailValid, "a valid email failed isEmailValid test")
    }
    
    func testCreateAccountModelValidator_WhenInvalidEmailIsProvided_ShouldReturnFalse() {
        //Act
        let isEmailValid = sut.isValidEmailFormat(email: "MyEmail@gmail@com")

        //Assert
        XCTAssertFalse(isEmailValid, "an invalid email did not fail isEmailValid test")
    }
    
    func testCreateAccountModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Tony")

        //Assert
        XCTAssertTrue(isFirstNameValid, "a valid first name failed isFirstNameValid test")
    }
    
    func testCreateAccountModelValidator_WhenTooShortFirstNameIsProvided_ShouldReturnFalse() {
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "T")

        //Assert
        XCTAssertFalse(isFirstNameValid, "a too short first name did not fail isFirstNameValid test")
    }
      
    
    func testCreateAccountModelValidator_WhenTooLongFirstNameIsProvided_ShouldReturnFalse() {
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "togshetgstdgerdgtsdgdssdfvsdfvdsfvsfvcsfrdft")

        //Assert
        XCTAssertFalse(isFirstNameValid, "a too long first name did not fail isFirstNameValid test")
    }
    
    func testCreateAccountModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Harvey")

        //Assert
        XCTAssertTrue(isLastNameValid, "a valid last name failed isLastNameValid test")
    }
    
    func testCreateAccountModelValidator_WhenTooShortLastNameIsProvided_ShouldReturnFalse() {
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "H")

        //Assert
        XCTAssertFalse(isLastNameValid, "a too short last name did not fail isLastNameValid test")
    }
      
    func testCreateAccountModelValidator_WhenTooLongLasttNameIsProvided_ShouldReturnFalse() {
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "togshetgstdgerdgtsdgdssdfvsdfvdsfvsfvcsfrdft")

        //Assert
        XCTAssertFalse(isLastNameValid, "a too long last name did not fail isLastNameValid test")
    }
    
    func testCreateAccountModelValidator_WhenPWDoesNotHaveANumber_ShouldReturnFalse() {
        //Act
        let doesPWHaveNumber = sut.isPasswordValid(password: "qwertyui")

        //Assert
        XCTAssertFalse(doesPWHaveNumber, "The PW did not have a number, but it did not return false")
    }
    
    func testCreateAccountModelValidator_WhenPWDoesNotHaveALetter_ShouldReturnFalse() {
        //Act
        let doesPWHaveLetter = sut.isPasswordValid(password: "85875786576858")

        //Assert
        XCTAssertFalse(doesPWHaveLetter, "The PW did not have a letter, but it did not return false")
    }
    
    func testCreateAccountModelValidator_WhenPWIsNotAtLeastEightCharacters_ShouldReturnFalse() {
        //Act
        let isPW8Chars = sut.isPasswordValid(password: "123CVS")

        //Assert
        XCTAssertFalse(isPW8Chars, "The PW is not at least 8 characters, but it did not return false")
    }
    
    func testCreateAccountModelValidator_WhenPWIsMoreThan64Characters_ShouldReturnFalse() {
        //Act
        let isLessThan64Chars = sut.isPasswordValid(password: "123CVSslfhasdlfhdslkjfhaslkdfhsLKDjfhSLKDJZhfasklJEDzhflKSJDzhxfLKJSDZhflSKJDZhfLSKJDsdfsfsdfdaZhxcLSKJDzhfSLKDJZhcfz;kjhdfC")

        //Assert
        XCTAssertFalse(isLessThan64Chars, "The PW is over 64 characters, but it did not return false")
    }
    
    func testCreateAccountModelValidator_WhenContainsWordPassword_ShouldReturnFalse() {
        //Act
        let doesPWAvoidTheWordPassword = sut.isPasswordValid(password: "passwordForCVS1234")

        //Assert
        XCTAssertFalse(doesPWAvoidTheWordPassword, "The has the word password, but it did not return false")
    }
    
}
