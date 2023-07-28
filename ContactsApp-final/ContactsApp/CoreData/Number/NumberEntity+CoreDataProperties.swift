//
//  NumberEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//
//

import Foundation
import CoreData


extension NumberEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NumberEntity> {
        return NSFetchRequest<NumberEntity>(entityName: "NumberEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var phnNum: String?
    @NSManaged public var phnNumType: String?
    @NSManaged public var numToContact: ContactEntity?

}

extension NumberEntity : Identifiable {
    /// function to return data in form of NumberModel
    /// - Returns: NumberModel
    func convertToNumber() -> NumberModel{
        return NumberModel(mobileNumber: self.phnNum!, mobileNumberType: self.phnNumType!)
    }
}
