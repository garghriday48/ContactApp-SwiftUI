//
//  Constants.swift
//  ContactsApp
//
//  Created by Pragath on 21/04/23.
//

import Foundation

class Constants{
    
    //MARK: for headings in view and sections
    static let searchSectionHeading = "Top Name Matches"
    static let contactsListHeading = "Contacts"
    static let addContactHeading = "New Contact"
    static let editContactHeading = "Edit Contact"
    static let tagsHeading = "Label"
    static let edit = "Edit"
    
    //MARK: tags for number and email
    static let phoneType = ["Mobile", "Home", "Work", "School", "iPhone", "Apple Watch", "Main", "Home Fax", "Work Fax", "Pager", "Other"]
    static let emailType = ["Home", "Work", "School", "iCloud", "Other"]
    static let addressType = ["Home", "Work", "School", "Other"]
    static let dateType = ["Birthday", "Anniversary", "Other"]
    static let urlType = ["Homepage", "Home", "Work", "School", "Other"]
    static let profileType = ["Twitter", "Facebook", "LinkedIn", "Instagram", "Other"]
    static let messageType = ["Skype", "Facebook", "MSN", "Yahoo", "Other"]
    
    //MARK: System image names
    static let plus = "plus"
    static let magnifyingGlass = "magnifyingglass"
    static let plusFill = "plus.circle.fill"
    static let personFill = "person.circle.fill"
    static let right = "chevron.right"
    static let checkmark = "checkmark"
    static let message = "message.fill"
    static let phone = "phone.fill"
    static let mail = "mail.fill"
    
    //MARK: for empty search view
    static let emptyViewText1 = "No results for"
    static let emptyViewText2 = "Check for spelling or try a new search."
    
    //MARK: to display in textFields
    static let firstName = "First name"
    static let lastName = "Last name"
    static let company = "Company"
    
    //MARK: to display in boxes in detail view
    static let messageText = "message"
    static let phoneText = "phone"
    static let mailText = "mail"
    
    //MARK: for placeholder in number and email fields
    static let numPlaceholder = "Phone"
    static let mailPlaceholder = "E-mail"
    static let streetPlaceholder = "Street"
    static let cityPlaceholder = "City"
    static let statePlaceholder = "State"
    static let countryPlaceholder = "Country"
    static let zipPlaceholder = "ZIP"
    static let datePlaceholder = "Date"
    static let urlPlaceholder = "URL"
    static let profilePlaceholder = "Social Profile"
    static let messagePlaceholder = "Instant Message"
    
    
    //MARK: for cell heading
    static let phoneCellHeading = "add phone"
    static let emailCellHeading = "add email"
    static let addressCellHeading = "add address"
    static let dateCellHeading = "add date"
    static let urlCellHeading = "add url"
    static let profileCellHeading = "add social profile"
    static let messageCellheading = "add instant message"
    static let notesCellHeading = "Notes"
    
    //MARK: button and alerts text
    static let doneButton = "Done"
    static let cancelButton = "Cancel"
    static let deleteButton = "Delete"
    static let deleteSectionText = "Delete Contact"
    
    
    static let deleteAlertHeading = "Are you sure you want to discard this new contact?"
    static let discardButton = "Discard Changes"
    static let keepEditingButton = "Keep Editing"
    
    //MARK: for images
    static let addImage = "Add Photo"
    static let editImage = "Edit"
    
    //MARK: text for buttons in detail view
    static let sendMessage = "Send Message"
    static let shareContact = "Share Contact"
    static let addToFav = "Add to Favourites"
    static let addToEmergencyCont = "Add to Emergency Contacts"
    static let shareLocation = "Share My Location"
    static let addToList = "Add to List"
    
    //MARK: used for date
    static var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    static var days = [Int](1..<32)
    static var years = [Int](1923..<2024)
    
    
    static var noName = "No Name"
}
