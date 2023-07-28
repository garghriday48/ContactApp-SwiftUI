//
//  NumberModel.swift
//  ContactsApp
//
//  Created by Pragath on 21/04/23.
//

import Foundation

class NumberModel: Identifiable{
    static func == (lhs: NumberModel, rhs: NumberModel) -> Bool {
        return lhs.mobileNumber == rhs.mobileNumber
    }
    
//    static func < (lhs: NumberModel, rhs: NumberModel) -> Bool {
//        return lhs.mobileNumber < rhs.mobileNumber
//    }
//    
    
    var id: UUID
    var mobileNumType: String
    var mobileNumber: String
    
    init(mobileNumber: String, mobileNumberType: String) {
        self.id = UUID()
        self.mobileNumber = mobileNumber
        self.mobileNumType = mobileNumberType
    }
}
