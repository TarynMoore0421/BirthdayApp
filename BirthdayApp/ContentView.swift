//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends: [Friend]=[Friend(name:"Taryn",birthday:.now),Friend(name:"Hope",birthday: Date(timeIntervalSince1970:0))]
    @Environment(\.modelContext) var context
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        NavigationStack {
            List(friends) {friend in
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
                        context.insert(newFriend)
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
        .modelContainer(for: Friend.self, inMemory: true)
}
