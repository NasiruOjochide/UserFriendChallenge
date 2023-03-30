//
//  ContentView.swift
//  UserFriendChallenge
//
//  Created by Danjuma Nasiru on 08/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers : FetchedResults<CashedUser>
    
    @StateObject var userss = Users()
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(cachedUsers, id: \.id){user in
                        NavigationLink{
                            UserDetails(user: user)
                        } label: {
                            HStack(alignment: .bottom){
                                Text(user.wrappedName)
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 0){
                                    user.isActive ? Text("Active") : Text("Offline")
                                    Image(systemName: "circle.fill").resizable().scaledToFit().frame(width: 10, height: 10).foregroundColor(user.isActive ? .green : .gray)
                                }
                            }
                        }
                    
                    }}.task{
                        if userss.users.isEmpty{
                            await fetchdata()
                            
                            await MainActor.run{
                                for user in userss.users{
                                    let cachedUser = CashedUser(context: moc)
                                    
                                    cachedUser.id = user.id
                                    cachedUser.name = user.name
                                    cachedUser.isActive = user.isActive
                                    cachedUser.address = user.address
                                    cachedUser.age = Int16(user.age)
                                    cachedUser.about = user.about
                                    cachedUser.company = user.company
                                    cachedUser.tags = user.stringTags
                                    cachedUser.email = user.email
                                    cachedUser.registered = user.registered
                                    for friend in user.friends{
                                        let cachedfriend = CashedFriend(context: moc)
                                        cachedfriend.id = friend.id
                                        cachedfriend.name = friend.name
                                        cachedfriend.user = cachedUser
                                    }
                                    
                                    
                                }
                                
                                try? moc.save()
                            }
                        }
                    }
                
                
            }.navigationTitle("Users")
        }
    }
    
    func fetchdata() async{
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        do{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decodedData = try decoder.decode([User].self, from: data)
            userss.users = decodedData
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
