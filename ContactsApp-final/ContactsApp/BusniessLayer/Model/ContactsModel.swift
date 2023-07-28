//
//  ContactsData.swift
//  ContactsApp
//
//  Created by Pragath on 17/04/23.
//

import Foundation


import Foundation
import SwiftUI

class ContactsModel: Identifiable {
    
//properties
    var id: UUID
    var firstName: String
    var lastName: String
    var company: String
    var profilePic: Data
    var notes: String
    var number: [NumberModel]
    var email: [EmailModel]
    var address: [AddressModel]
    var date: [DateModel]
    var url: [UrlModel]
    var profile: [ProfileModel]
    var message: [MessageModel]

    
    //initializer
    init(id:UUID = UUID(), firstName: String, lastName: String, company: String, number: [NumberModel], email: [EmailModel], address: [AddressModel], date: [DateModel], profilePic: Data, notes: String, url: [UrlModel], profile: [ProfileModel], message: [MessageModel]) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.profilePic = profilePic
        self.number = number
        self.email = email
        self.address = address
        self.date = date
        self.notes = notes
        self.url = url
        self.profile = profile
        self.message = message
    }
    
    
    func getfullname() -> String {
        
        if self.firstName != "" && self.lastName != ""{
            return self.firstName.capitalized + " " + self.lastName.capitalized
        }
        else if self.firstName != "" {
            return firstName.capitalized
        }
        else if lastName != "" {
            return lastName.capitalized
        }
        else if company != ""{
            return company.capitalized
        }
        return ""
    }
}
