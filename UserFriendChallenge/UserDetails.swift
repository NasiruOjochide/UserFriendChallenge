//
//  UserDetails.swift
//  UserFriendChallenge
//
//  Created by Danjuma Nasiru on 08/02/2023.
//

import SwiftUI

struct UserDetails: View {
    
    let user : CashedUser
    
    var body: some View {
        ScrollView{
        VStack(alignment: .center, spacing: 30){
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(user.wrappedName).font(.title.bold())
            Image(systemName: "circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(user.isActive ? .green : .gray)
                .padding(.top, -25)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Age: \(user.age)")
                Text("Email: \(user.wrappedEmail)")
                Text("Company: \(user.wrappedCompany)")
                Text("Date Registered: \(user.wrappedRegistered)")
            }
            .padding()
            .background(.gray.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.cyan, lineWidth: 2))
            
            Text("More About \(user.wrappedName)").padding(.bottom, -20).frame( alignment: .leading)
            
            Text(user.wrappedAbout)
                .padding()
                .background(.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay{RoundedRectangle(cornerRadius: 8).stroke(.blue, lineWidth: 2)}
            
            ScrollView(.horizontal, showsIndicators: false){
            LazyHStack{
                ForEach(user.wrappedFriends, id: \.name){friend in
                    HStack{
                        Image(systemName: "person.fill").resizable().scaledToFit()
                        Text(friend.wrappedName)
                    }
                    .padding()
                    .background(.gray.opacity(0.5))
                    .clipShape(Capsule())
                    //.overlay{Capsule().stroke(.cyan)}
                    .overlay(content: {Capsule().stroke(lineWidth: 2)})
                }
            }
        }
            
        }.padding(.horizontal)
    }
    }
}

//struct UserDetails_Previews: PreviewProvider {
//    let u = User(id: "", isActive: true, name: "bh", age: 21, company: "", email: "", address: "", about: "", registered: Date.now, tags: [], friends: [])
//    static var previews: some View {
//        UserDetails(user: u)
//    }
//}
