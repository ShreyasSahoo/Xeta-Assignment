//
//  ContentView.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
            Home()
                .tabItem {
                    Image("activity")
                    Text("Activity")
                   
                }
                .tag(0)
            Goals()
                .tabItem {
                    Image("goals")
                    Text("Goals")
                    
                }
                .tag(0)
            Camera()
                .tabItem {
                    Image("camera")
                    Text("Camera")
                    
                }
                .tag(0)
            Feed()
                .tabItem {
                    Image("feed")
                    Text("Feed")
                }
                .tag(0)
            Profile()
                .tabItem {
                    Image("profile")
                    Text("Profile")
                }
                .tag(0)
        }
        
    }
}

#Preview {
    ContentView()
}
