//
//  ContactEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//
//

import Foundation
import CoreData


extension ContactEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactEntity> {
        return NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
    }

    @NSManaged public var company: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var profilePic: Data?
    @NSManaged public var notes: String?
    @NSManaged public var toAddress: Set<AddressEntity>?
    @NSManaged public var toDate: Set<DateEntity>?
    @NSManaged public var toEmail: Set<EmailEntity>?
    @NSManaged public var toNumber: Set<NumberEntity>?
    @NSManaged public var toUrl: Set<UrlEntity>?
    @NSManaged public var toProfile: Set<SocialProfileEntity>?
    @NSManaged public var toMessage: Set<MessageEntity>?

}

// MARK: Generated accessors for toAddress
extension ContactEntity {

    @objc(addToAddressObject:)
    @NSManaged public func addToToAddress(_ value: AddressEntity)

    @objc(removeToAddressObject:)
    @NSManaged public func removeFromToAddress(_ value: AddressEntity)

    @objc(addToAddress:)
    @NSManaged public func addToToAddress(_ values: Set<AddressEntity>)

    @objc(removeToAddress:)
    @NSManaged public func removeFromToAddress(_ values: Set<AddressEntity>)

}

// MARK: Generated accessors for toDate
extension ContactEntity {

    @objc(addToDateObject:)
    @NSManaged public func addToToDate(_ value: DateEntity)

    @objc(removeToDateObject:)
    @NSManaged public func removeFromToDate(_ value: DateEntity)

    @objc(addToDate:)
    @NSManaged public func addToToDate(_ values: Set<DateEntity>)

    @objc(removeToDate:)
    @NSManaged public func removeFromToDate(_ values: Set<DateEntity>)

}

// MARK: Generated accessors for toEmail
extension ContactEntity {

    @objc(addToEmailObject:)
    @NSManaged public func addToToEmail(_ value: EmailEntity)

    @objc(removeToEmailObject:)
    @NSManaged public func removeFromToEmail(_ value: EmailEntity)

    @objc(addToEmail:)
    @NSManaged public func addToToEmail(_ values: Set<EmailEntity>)

    @objc(removeToEmail:)
    @NSManaged public func removeFromToEmail(_ values: Set<EmailEntity>)

}

// MARK: Generated accessors for toNumber
extension ContactEntity {

    @objc(addToNumberObject:)
    @NSManaged public func addToToNumber(_ value: NumberEntity)

    @objc(removeToNumberObject:)
    @NSManaged public func removeFromToNumber(_ value: NumberEntity)

    @objc(addToNumber:)
    @NSManaged public func addToToNumber(_ values: Set<NumberEntity>)

    @objc(removeToNumber:)
    @NSManaged public func removeFromToNumber(_ values: Set<NumberEntity>)

}

// MARK: Generated accessors for toUrl
extension ContactEntity {

    @objc(addToUrlObject:)
    @NSManaged public func addToToUrl(_ value: UrlEntity)

    @objc(removeToUrlObject:)
    @NSManaged public func removeFromToUrl(_ value: UrlEntity)

    @objc(addToUrl:)
    @NSManaged public func addToToUrl(_ values: Set<UrlEntity>)

    @objc(removeToUrl:)
    @NSManaged public func removeFromToUrl(_ values: Set<UrlEntity>)

}

// MARK: Generated accessors for toProfile
extension ContactEntity {

    @objc(addToProfileObject:)
    @NSManaged public func addToToProfile(_ value: SocialProfileEntity)

    @objc(removeToProfileObject:)
    @NSManaged public func removeFromToProfile(_ value: SocialProfileEntity)

    @objc(addToProfile:)
    @NSManaged public func addToToProfile(_ values: Set<SocialProfileEntity>)

    @objc(removeToProfile:)
    @NSManaged public func removeFromToProfile(_ values: Set<SocialProfileEntity>)

}

// MARK: Generated accessors for toMessage
extension ContactEntity {

    @objc(addToMessageObject:)
    @NSManaged public func addToToMessage(_ value: MessageEntity)

    @objc(removeToMessageObject:)
    @NSManaged public func removeFromToMessage(_ value: MessageEntity)

    @objc(addToMessage:)
    @NSManaged public func addToToMessage(_ values: Set<MessageEntity>)

    @objc(removeToMessage:)
    @NSManaged public func removeFromToMessage(_ values: Set<MessageEntity>)

}

extension ContactEntity : Identifiable {
    /// function to return data in form of ContactsModel
    /// - Returns: ContactsModel
    func convertToContact() -> ContactsModel {
        return ContactsModel(id: self.id!, firstName: self.firstName!, lastName: self.lastName!, company: self.company!, number: self.convertToNumbers() ?? [], email: self.convertToEmails() ?? [], address: self.convertToAddresss() ?? [], date: self.convertToDates() ?? [], profilePic: self.profilePic ?? Data(), notes: self.notes ?? "Notes", url: self.convertToURLs() ?? [], profile:  self.convertToProfiles() ?? [], message: self.convertToMessages() ?? [])
    }
    
    
    /// function to returrn data in array of NumberModel (from set)
    /// - Returns: array of NumberModel
    private func convertToNumbers() -> [NumberModel]?{
        guard self.toNumber != nil && self.toNumber?.count != 0 else{return nil}
    
        var numbers: [NumberModel] = []
    
        self.toNumber?.forEach({ (cdnumber) in
            numbers.append(cdnumber.convertToNumber())
        })
    
        return numbers
    }
    
    /// function to returrn data in array of EmailModel (from set)
    /// - Returns: array of EmailModel
    private func convertToEmails() -> [EmailModel]?{
        guard self.toEmail != nil && self.toEmail?.count != 0 else{return nil}
    
        var emails: [EmailModel] = []
    
        self.toEmail?.forEach({ (cdemail) in
            emails.append(cdemail.convertToEmail())
        })
    
        return emails
    }
    
    private func convertToAddresss() -> [AddressModel]?{
        guard self.toAddress != nil && self.toAddress?.count != 0 else{return nil}
    
        var addresss: [AddressModel] = []
    
        self.toAddress?.forEach({ (cdaddress) in
            addresss.append(cdaddress.convertToAddress())
        })
    
        return addresss
    }
    
    private func convertToDates() -> [DateModel]?{
        guard self.toDate != nil && self.toDate?.count != 0 else{return nil}
    
        var dates: [DateModel] = []
    
        self.toDate?.forEach({ (cddate) in
            dates.append(cddate.convertToDate())
        })
    
        return dates
    }
    
    private func convertToURLs() -> [UrlModel]?{
        guard self.toUrl != nil && self.toUrl?.count != 0 else{return nil}
    
        var urls: [UrlModel] = []
    
        self.toUrl?.forEach({ (cdurl) in
            urls.append(cdurl.convertToUrl())
        })
    
        return urls
    }
    
    private func convertToProfiles() -> [ProfileModel]?{
        guard self.toProfile != nil && self.toProfile?.count != 0 else{return nil}
    
        var profiles: [ProfileModel] = []
    
        self.toProfile?.forEach({ (cdprofile) in
            profiles.append(cdprofile.convertToProfile())
        })
    
        return profiles
    }
    
    private func convertToMessages() -> [MessageModel]?{
        guard self.toMessage != nil && self.toMessage?.count != 0 else{return nil}
    
        var messages: [MessageModel] = []
    
        self.toMessage?.forEach({ (cdmessage) in
            messages.append(cdmessage.convertToMessage())
        })
    
        return messages
    }
}
