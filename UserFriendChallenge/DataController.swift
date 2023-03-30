//
//  DataController.swift
//  UserFriendChallenge
//
//  Created by Danjuma Nasiru on 09/02/2023.
//
import CoreData
import Foundation

class DataController : ObservableObject{
    var container = NSPersistentContainer(name: "FriendFace")
    
    init(){
        container.loadPersistentStores(completionHandler: {(description, error) in
            if let error = error{
                print("Error loading data \(error.localizedDescription)")
            }
        })
    }
}
