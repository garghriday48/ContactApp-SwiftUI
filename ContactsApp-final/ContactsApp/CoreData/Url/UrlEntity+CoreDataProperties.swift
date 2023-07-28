//
//  UrlEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//
//

import Foundation
import CoreData


extension UrlEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UrlEntity> {
        return NSFetchRequest<UrlEntity>(entityName: "UrlEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var urlType: String?
    @NSManaged public var url: String?
    @NSManaged public var urlToContact: ContactEntity?

}

extension UrlEntity : Identifiable {
    /// function to return data in form of UrlModel
    /// - Returns: UrlModel
    func convertToUrl() -> UrlModel{
        return UrlModel(url: self.url!, urlType: self.urlType!)
    }
}
