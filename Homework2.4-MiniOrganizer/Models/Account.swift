//
//  User.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 29.05.2021.
//

import Foundation
import UIKit



struct Account: Identifiable, Codable {
    let id: UUID = UUID()
    var username: String
    var password: String
    var email: String
    var questionnaire: Questionnaire?
    
    init(
        //id: UUID,
        username: String,
        password: String,
        email: String = "Empty",
        questionnaire: Questionnaire
    ) {
        //self.id = UUID()
        self.username = username
        self.password = password
        self.email = email
        self.questionnaire = questionnaire
    }
    
}

struct Questionnaire: Codable {
    var firstName: String = "Empty"
    var middleName: String = "Empty"
    var lastName: String = "Empty"
    var birthday: Date?
    var foto: UIImage?
    var sex: Sex = Sex.none
    var about: String = "Empty"
    var country: String = "Empty"
    var city: String = "Empty"
    
    var fullName: String {
        if firstName != "Empty" {
            if lastName != "Empty" {
                if middleName != "Empty" {
                    return String(firstName + " " + middleName + " " + lastName)
                } else {
                    return String(firstName + " " + lastName)
                }
            } else {
                return firstName
            }
        } else {
            return String("")
        }
    }
    
    var fullAge: Int {
        if let birthday = birthday {
            return Int(birthday.timeIntervalSinceNow)
        } else {
            return 0
        }
    }
}


enum Sex: String, Codable {
    case none = "None"
    case male = "Male"
    case female = "Feamle"
    case another = "Another"
}
