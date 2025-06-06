//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend]=[Friend(name:"Taryn",birthday:.now),Friend(name:"Hope",birthday: Date(timeIntervalSince1970:0))]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        NavigationStack {
            List(friends, id:\.name) {friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday,format:.dateTime.month (.wide) .day() .year())
                }//end HStack
            }// end List
            .navigationBarTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text ("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                                
                    }//end DatePicker
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }//end button
                    .bold()
                }//end VStack
                .padding()
                .background(.bar)
            }//end safe area
            
        }//end NavStack
    }//end body
}//end struct


#Preview {
    ContentView()
}
