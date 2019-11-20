//
//  ProfileItem.swift
//  Luv
//
//  Created by Rishabh Anand on 11/19/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import SwiftUI

struct ProfileItem: View {
    
    let profile: UserProfile
    
    var body: some View {
        HStack {
            Image("ImageUnavailable")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70.0, height: 105.0)
            VStack(alignment: .leading) {
                Text("Name: " +  profile.name)
                Text("Survey Score: " + String(profile.surveyScore))
            }
        } // End of HStack
        .font(.system(size: 14))
    }
}

struct ProfileItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItem(profile: profileMatches[0])
    }
}
