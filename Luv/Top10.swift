//
//  Top10.swift
//  Luv
//
//  Created by Rishabh Anand on 11/19/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import SwiftUI

struct Top10: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.profileList) { aProfile in
                    NavigationLink(destination: ProfileDetail(profile: aProfile)) {
                        ProfileItem(profile: aProfile)
                    }
                }
            } // End of List
            .navigationBarTitle(Text("Top 10 Matches"), displayMode: .inline)
        } // End of Navigation View
    }
}

struct Top10_Previews: PreviewProvider {
    static var previews: some View {
        Top10()
    }
}
