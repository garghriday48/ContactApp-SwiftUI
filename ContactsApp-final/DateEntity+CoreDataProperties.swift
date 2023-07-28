//
//  DateEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//
//

import Foundation
import CoreData


extension DateEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DateEntity> {
        return NSFetchRequest<DateEntity>(entityName: "DateEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: String?
    @NSManaged public var dateType: String?
    @NSManaged public var dateToContact: ContactEntity?

}

extension DateEntity : Identifiable {
    /// function to return data in form of DateModel
    /// - Returns: DateModel
    func convertToDate() -> DateModel{
        return DateModel(date: self.date!, dateType: self.dateType!)
    }
}
