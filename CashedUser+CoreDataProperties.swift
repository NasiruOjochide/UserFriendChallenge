//
//  CashedUser+CoreDataProperties.swift
//  UserFriendChallenge
//
//  Created by Danjuma Nasiru on 09/02/2023.
//
//

import Foundation
import CoreData


extension CashedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CashedUser> {
        return NSFetchRequest<CashedUser>(entityName: "CashedUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var age: Int16
    @NSManaged public var about: String?
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
    var wrappedName:String{
        name ?? "unknown"
    }
    
    var wrappedAbout: String{
        about ?? "no info"
    }
    
    var wrappedCompany:String{
        company ?? "Unemployed"
    }
    
    var wrappedEmail: String{
        email ?? "no email"
    }
    
    var wrappedAddress: String{
        address ?? "homeless"
    }
    
    var wrappedRegistered: String{
        registered?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var wrappedId : UUID{
        id ?? UUID()
    }
    
    var wrappedTags : String{
        tags ?? "N/A"
    }
    
    var wrappedFriends : [CashedFriend]{
        let set = friends as? Set<CashedFriend> ?? []
        return set.sorted{
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friends
extension CashedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CashedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CashedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CashedUser : Identifiable {

}
