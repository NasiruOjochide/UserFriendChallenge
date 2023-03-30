//
//  UserFriendChallengeApp.swift
//  UserFriendChallenge
//
//  Created by Danjuma Nasiru on 08/02/2023.
//

import SwiftUI

@main
struct UserFriendChallengeApp: App {
    
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
