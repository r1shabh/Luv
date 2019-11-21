//
//  EditProfile.swift
//  Luv
//
//  Created by Tyler Flesch on 11/20/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import SwiftUI

struct EditProfile: View {
    @State private var tempName = name
    @State private var tempBirth = birthday
    @State private var tempContact = contact
    @State private var tempProfilePic = profilePicture
    @State private var tempDescription = description
    @Environment(\.presentationMode) var presentationMode
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    var body: some View {
        VStack(alignment: .center){
            HStack {
                Text("Name: ")
                TextField("FirstName, LastName", text: $tempName)
            }.padding()
            Image(tempProfilePic).resizable()
                .aspectRatio(contentMode: .fit).frame(width:100)
                .cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orange, lineWidth: 4))
                .shadow(radius: 10).padding(2)
            HStack {
                Text("Birthday:")
                DatePicker(selection: $tempBirth, in: ...Date(), displayedComponents: .date) {
                    Text("")
                }
            }.padding()
            HStack {
                Text("Phone Number: ")
                TextField("XXX-XXX-XXXX", text: $tempContact[0])
            }.padding()
            HStack {
                Text("Email: ")
                TextField("example@LUV.com", text: $tempContact[1])
            }.padding()
            Form {
                Group {
                    Section(header: Text("Survey Results / Description")) {
                        TextField("Edit each section for the Survey Results / Description", text: $tempDescription)
                    }
                }
            }
            Button(action: {
                name = self.tempName
                profilePicture = self.tempProfilePic
                birthday = self.tempBirth
                contact[0] = self.tempContact[0]
                contact[1] = self.tempContact[1]
                description = self.tempDescription
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Submit")
            }
        }
    }
                            
}
