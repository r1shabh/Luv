//
//  Profile.swift
//  Luv
//
//  Created by Tyler Flesch on 11/19/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import SwiftUI

var editting = false
var name = "FirstName LastName"
var birthday = Date()
var contact = ["1234567890", "example@gmail.com"]
var profilePicture = "profilePic"
var description = "Form that lists personal characteristics of user, input from initial survey that can be subject to change with the edit button"

struct Profile: View {
    @State private var showSheet = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                        Image(profilePicture).resizable()
                        .aspectRatio(contentMode: .fit).frame(width:100)
                        .cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 4))
                        .shadow(radius: 10).padding(2)
                        VStack(alignment: .leading) {
                            Text("Name: \(name)")
                            Text("Birthday: \(date)")
                            Text("Contact Info:")
                            if(contact.count == 2) {
                                Text("Phone Number: \(contact[0])")
                                Text("Email: \(contact[1])")
                            } else if(contact.count == 1) {
                                if(contact[0].contains("@")) {
                                    Text("Email: \(contact[0])")
                                } else {
                                    Text("Phone Number: \(contact[0])")
                                }
                            } else {
                                Text("No Contact Info available at this time")
                            }
                        }
                    }
                    Form {
                        Group {
                            Section(header: Text("Survey Results / Description")) {
                                Text(description)
                            }
                            Section(header: Text("List of Favorite Locations")) {
                                NavigationLink(destination: FavoriteLocations()) {
                                    Image(systemName: "location.fill")
                                }
                            }
                            Section(header: Text("List of Favorite Date Ideas")) {
                                NavigationLink(destination: FavoriteIdeas()) {
                                    Image(systemName: "bubble.left.fill")
                                }
                            }
                        }
                    }
            }.padding(2).navigationBarTitle(Text("Profile"), displayMode: .inline).navigationBarItems(leading: Button(action: {self.showSheet = true}) {
                Text("Edit")
            }).sheet(isPresented: $showSheet) {
                EditProfile()
            }
        }
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        return dateFormatter.string(from: birthday)
    }
    
}

