//
//  MessageEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//
//

import Foundation
import CoreData


extension MessageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MessageEntity> {
        return NSFetchRequest<MessageEntity>(entityName: "MessageEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var messageType: String?
    @NSManaged public var message: String?
    @NSManaged public var messageToContact: ContactEntity?

}

extension MessageEntity : Identifiable {
    /// function to return data in form of MessageModel
    /// - Returns: MessageModel
    func convertToMessage() -> MessageModel{
        return MessageModel(message: self.message!, messsageType: self.messageType!)
    }
}
