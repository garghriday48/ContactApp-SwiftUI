//
//  MessageModel.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//

import Foundation

class MessageModel: Identifiable{

    
    var id: UUID
    var message: String
    var messsageType: String
    
    init(message: String, messsageType: String) {
        self.id = UUID()
        self.message = message
        self.messsageType = messsageType
    }
}
