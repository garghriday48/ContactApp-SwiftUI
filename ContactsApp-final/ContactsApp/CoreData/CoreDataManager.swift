//
//  CoreDataManger.swift
//  ContactsApp
//
//  Created by Pragath on 21/04/23.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error{
                print(error)
            }
        }
    }
    
    
    /// Function to fetch all the data from core data
    /// - Returns: array of ContactsModel
    func getAll() -> [ContactsModel]?{
        let request = NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
        
        do{
            let result = try container.viewContext.fetch(request)
            var contacts: [ContactsModel] = []
            
            result.forEach({ (cdContact) in
                contacts.append(cdContact.convertToContact())
            })
            return contacts
        }
        catch let error{
            print("Error fetching. \(error)")
        }
        
        return nil
    }
    
    
    /// function to create a new entry in core data
    /// - Parameter contact: entry is of type ContactModel
    func create(contact: ContactsModel){
        let cdcontact = ContactEntity(context: container.viewContext)
        cdcontact.id = contact.id
        cdcontact.firstName = contact.firstName
        cdcontact.lastName = contact.lastName
        cdcontact.company = contact.company
        cdcontact.profilePic = contact.profilePic
        cdcontact.notes = contact.notes
        //
        if contact.number.count != 0{
            var numberSet = Set<NumberEntity>()
            contact.number.forEach ({ number in
                let cdnumber = NumberEntity(context: container.viewContext)
                cdnumber.id = contact.id
                cdnumber.phnNum = number.mobileNumber
                cdnumber.phnNumType = number.mobileNumType
                
                numberSet.insert(cdnumber)
            })
            cdcontact.toNumber = numberSet
        }
        
        if contact.email.count != 0{
            var emailSet = Set<EmailEntity>()
            contact.email.forEach ({ email in
                let cdemail = EmailEntity(context: container.viewContext)
                cdemail.id = contact.id
                cdemail.email = email.email
                cdemail.emailType = email.emailType
                
                emailSet.insert(cdemail)
            })
            cdcontact.toEmail = emailSet
        }
        
        if contact.address.count != 0{
            var addressSet = Set<AddressEntity>()
            contact.address.forEach ({ address in
                let cdaddress = AddressEntity(context: container.viewContext)
                cdaddress.id = contact.id
                cdaddress.street1 = address.street1
                cdaddress.street2 = address.street2
                cdaddress.state = address.state
                cdaddress.city = address.city
                cdaddress.zip = address.zip
                cdaddress.country = address.country
                cdaddress.addressType = address.addressType
                addressSet.insert(cdaddress)
            })
            cdcontact.toAddress = addressSet
        }
        
        if contact.date.count != 0{
            var dateSet = Set<DateEntity>()
            contact.date.forEach ({ date in
                let cddate = DateEntity(context: container.viewContext)
                cddate.id = contact.id
                cddate.date = date.date
                cddate.dateType = date.dateType
                
                dateSet.insert(cddate)
            })
            cdcontact.toDate = dateSet
        }
        
        if contact.url.count != 0{
            var urlSet = Set<UrlEntity>()
            contact.url.forEach ({ date in
                let cdurl = UrlEntity(context: container.viewContext)
                cdurl.id = contact.id
                cdurl.url = date.url
                cdurl.urlType = date.urlType
                
                urlSet.insert(cdurl)
            })
            cdcontact.toUrl = urlSet
        }
        
        if contact.profile.count != 0{
            var profileSet = Set<SocialProfileEntity>()
            contact.profile.forEach ({ profile in
                let cdprofile = SocialProfileEntity(context: container.viewContext)
                cdprofile.id = contact.id
                cdprofile.profile = profile.profile
                cdprofile.profileType = profile.profileType
                
                profileSet.insert(cdprofile)
            })
            cdcontact.toProfile = profileSet
        }
        
        if contact.message.count != 0{
            var messageSet = Set<MessageEntity>()
            contact.message.forEach ({ message in
                let cdmessage = MessageEntity(context: container.viewContext)
                cdmessage.id = contact.id
                cdmessage.message = message.message
                cdmessage.messageType = message.messsageType
                
                messageSet.insert(cdmessage)
            })
            cdcontact.toMessage = messageSet
        }
        saveData()
    }
    
    
    /// Function to fetch data from core data based on id of contact
    /// - Parameter id: id of type UUID
    /// - Returns: returns a entry from core data of type ContactsModel based on id
    func get(byIdentifier id: UUID) -> ContactsModel? {
        let result = getCDContact(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToContact()
        
    }
    
    
    /// function to update the existing entry in coredata
    /// - Parameter contact: existing entry is of type ContactsModel
    func update(contact:ContactsModel) {
        //retrieve the record which is to be updated
        let cdcontact = getCDContact(byIdentifier: contact.id)
        guard cdcontact != nil else {return}
        
        cdcontact?.firstName = contact.firstName
        cdcontact?.lastName = contact.lastName
        cdcontact?.company = contact.company
        cdcontact?.profilePic = contact.profilePic
        cdcontact?.notes = contact.notes
        
        if contact.number.count != 0{
            var numberSet = Set<NumberEntity>()
            contact.number.forEach ({ number in
                let cdnumber = NumberEntity(context: container.viewContext)
                cdnumber.id = number.id
                cdnumber.phnNum = number.mobileNumber
                cdnumber.phnNumType = number.mobileNumType
                
                numberSet.insert(cdnumber)
            })
            cdcontact?.toNumber = numberSet
        }
        
        if contact.email.count != 0{
            var emailSet = Set<EmailEntity>()
            contact.email.forEach ({ email in
                let cdemail = EmailEntity(context: container.viewContext)
                cdemail.id = contact.id
                cdemail.email = email.email
                cdemail.emailType = email.emailType
                
                emailSet.insert(cdemail)
            })
            cdcontact?.toEmail = emailSet
        }
        
        if contact.address.count != 0{
            var addressSet = Set<AddressEntity>()
            contact.address.forEach ({ address in
                let cdaddress = AddressEntity(context: container.viewContext)
                cdaddress.id = contact.id
                cdaddress.street1 = address.street1
                cdaddress.street2 = address.street2
                cdaddress.state = address.state
                cdaddress.city = address.city
                cdaddress.zip = address.zip
                cdaddress.country = address.country
                cdaddress.addressType = address.addressType
                addressSet.insert(cdaddress)
            })
            cdcontact?.toAddress = addressSet
        }
        
        if contact.url.count != 0{
            var urlSet = Set<UrlEntity>()
            contact.url.forEach ({ date in
                let cdurl = UrlEntity(context: container.viewContext)
                cdurl.id = contact.id
                cdurl.url = date.url
                cdurl.urlType = date.urlType
                
                urlSet.insert(cdurl)
            })
            cdcontact?.toUrl = urlSet
        }
        
        if contact.profile.count != 0{
            var profileSet = Set<SocialProfileEntity>()
            contact.profile.forEach ({ profile in
                let cdprofile = SocialProfileEntity(context: container.viewContext)
                cdprofile.id = contact.id
                cdprofile.profile = profile.profile
                cdprofile.profileType = profile.profileType
                
                profileSet.insert(cdprofile)
            })
            cdcontact?.toProfile = profileSet
        }
        
        if contact.message.count != 0{
            var messageSet = Set<MessageEntity>()
            contact.message.forEach ({ message in
                let cdmessage = MessageEntity(context: container.viewContext)
                cdmessage.id = contact.id
                cdmessage.message = message.message
                cdmessage.messageType = message.messsageType
                
                messageSet.insert(cdmessage)
            })
            cdcontact?.toMessage = messageSet
        }
        
        if contact.date.count != 0{
            var dateSet = Set<DateEntity>()
            contact.date.forEach ({ date in
                let cddate = DateEntity(context: container.viewContext)
                cddate.id = contact.id
                cddate.date = date.date
                cddate.dateType = date.dateType
                
                dateSet.insert(cddate)
            })
            cdcontact?.toDate = dateSet
        }
        
        saveData()
        
        return
    }
    
    
    /// function to delete data from core data based on id
    /// - Parameter id: id of type UUID
    func delete(id: UUID) {
        
        let cdcontact = getCDContact(byIdentifier: id)
        guard cdcontact != nil else {return}
        container.viewContext.delete(cdcontact!)
        saveData()
    }
    
    
    /// function to save data into coredata
    func saveData(){
        
        do {
            try container.viewContext.save()
        } catch {
            print("Error saving. \(error)")
        }
    }
    
    
    
    /// private func to check whether the given record exists in database or not
    /// - Parameter id: id of tye UUID
    /// - Returns: returns the data entry in coredata based on id
    private func getCDContact(byIdentifier id: UUID) ->ContactEntity? {
        
        //Create a fetchRequest
        let fetchRequest = NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
        //To pass the condition in fetchRequiest we need to use a predicate
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        
        do{
            let result = try container.viewContext.fetch(fetchRequest).first
            
            guard result != nil else { return nil }
            return result
        }
        catch let error{
            debugPrint(error)
        }
        return nil
    }
}




