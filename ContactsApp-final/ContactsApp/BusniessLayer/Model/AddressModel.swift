//
//  AddressModel.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//

import Foundation

class AddressModel: Identifiable{

    
    var id: UUID
    var street1: String
    var street2: String
    var city: String
    var state: String
    var zip: String
    var country: String
    var addressType: String

    init(street1: String, street2: String, city: String, state: String, zip: String, country: String, addressType: String) {
        self.id = UUID()
        self.street1 = street1
        self.street2 = street2
        self.city = city
        self.state = state
        self.zip = zip
        self.country = country
        self.addressType = addressType
    }
}
