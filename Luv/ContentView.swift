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

        Profile()
        .tabItem {
            Image(systemName: "person.circle.fill").font(Font.title.weight(.regular))
            Text("Profile")
        }.tag(1)

        Top10()
        .tabItem {
            Image(systemName: "10.square.fill").font(Font.title.weight(.regular))
            Text("Top 10")
        }
        .tag(2)

        Locations()
        .tabItem {
            Image(systemName: "mappin.and.ellipse").font(Font.title.weight(.regular))
            Text("Locations")
        }.tag(3)

        }
        .font(.headline)
    }
}
