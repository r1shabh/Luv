//
//  ContentView.swift
//  Luv
//
//  Created by Rishabh Anand on 11/19/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        TabView {
            Profile().tabItem {
                Text("Profile")
            }
            Top10().tabItem {
                Text("Top10")
            }
            Locations().tabItem {
                Text("Locations")
            }
            Ideas().tabItem {
                Text("Ideas")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
