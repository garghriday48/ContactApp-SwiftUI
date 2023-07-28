//
//  DateModel.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//

import Foundation

class DateModel: Identifiable{

    
    var id: UUID
    var date: String
    var dateType: String
    
    init(date: String, dateType: String) {
        self.id = UUID()
        self.date = date
        self.dateType = dateType
    }
}
