//
//  EmailEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 25/04/23.
//
//

import Foundation
import CoreData


extension EmailEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmailEntity> {
        return NSFetchRequest<EmailEntity>(entityName: "EmailEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var emailType: String?
    @NSManaged public var id: UUID?
    @NSManaged public var emailToContact: ContactEntity?

}

extension EmailEntity : Identifiable {
    /// function to return data in form of EmailModel
    /// - Returns: EmailModel
    func convertToEmail() -> EmailModel{
        return EmailModel(email: self.email!, emailType: self.emailType!)
    }
}
