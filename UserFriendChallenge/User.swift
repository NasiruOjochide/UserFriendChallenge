//
//  User.swift
//  UserFriendChallenge
//
//  Created by Danjuma Nasiru on 08/02/2023.
//

import Foundation

struct User : Codable, Identifiable{
    let id : UUID
    let isActive : Bool
    let name : String
    let age : Int
    let company : String
    let email : String
    let address : String
    let about : String
    let registered : Date
    let tags : [String]
    let friends : [Friend]
    
    var stringTags : String {
        tags.joined(separator: ",")
    }
}
