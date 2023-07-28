//
//  EmailModel.swift
//  ContactsApp
//
//  Created by Pragath on 24/04/23.
//

import Foundation

class EmailModel: Identifiable{
//    static func == (lhs: EmailModel, rhs: EmailModel) -> Bool {
//        return lhs.mobileNumber == rhs.mobileNumber
//    }
    
//    static func < (lhs: NumberModel, rhs: NumberModel) -> Bool {
//        return lhs.mobileNumber < rhs.mobileNumber
//    }
//
    
    var id: UUID
    var email: String
    var emailType: String
    
    init(email: String, emailType: String) {
        self.id = UUID()
        self.email = email
        self.emailType = emailType
    }
}

