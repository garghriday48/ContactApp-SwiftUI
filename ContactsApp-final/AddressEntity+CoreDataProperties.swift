//
//  AddressEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//
//

import Foundation
import CoreData


extension AddressEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressEntity> {
        return NSFetchRequest<AddressEntity>(entityName: "AddressEntity")
    }

    @NSManaged public var street1: String?
    @NSManaged public var street2: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var zip: String?
    @NSManaged public var country: String?
    @NSManaged public var id: UUID?
    @NSManaged public var addressType: String?
    @NSManaged public var addressToContact: ContactEntity?

}

extension AddressEntity : Identifiable {
    /// function to return data in form of AddressModel
    /// - Returns: AddressModel
    func convertToAddress() -> AddressModel{
        return AddressModel(street1: self.street1!, street2: self.street2!, city: self.city!, state: self.state!, zip: self.zip!, country: self.country!, addressType: self.addressType!)
    }
}
