//
//  SocialProfileEntity+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Pragath on 26/04/23.
//
//

import Foundation
import CoreData


extension SocialProfileEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SocialProfileEntity> {
        return NSFetchRequest<SocialProfileEntity>(entityName: "SocialProfileEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var profileType: String?
    @NSManaged public var profile: String?
    @NSManaged public var profileToContact: ContactEntity?

}

extension SocialProfileEntity : Identifiable {
    /// function to return data in form of ProfieModel
    /// - Returns: ProfieModel
    func convertToProfile() -> ProfileModel{
        return ProfileModel(profile: self.profile!, profileType: self.profileType!)
    }
}
