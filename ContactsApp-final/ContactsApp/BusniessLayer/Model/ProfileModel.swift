//
//  ProfileModel.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//

import Foundation

class ProfileModel: Identifiable{

    
    var id: UUID
    var profile: String
    var profileType: String
    
    init(profile: String, profileType: String) {
        self.id = UUID()
        self.profile = profile
        self.profileType = profileType
    }
}
