//
//  CashedFriend+CoreDataProperties.swift
//  UserFriendChallenge
//
//  Created by Danjuma Nasiru on 09/02/2023.
//
//

import Foundation
import CoreData


extension CashedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CashedFriend> {
        return NSFetchRequest<CashedFriend>(entityName: "CashedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CashedUser?
    
    var wrappedName : String{
        name ?? "unknown"
    }

}

extension CashedFriend : Identifiable {

}
