//
//  RouteView.swift
//  track
//
//  Created by Sam Svindland on 1/27/24.
//

import SwiftUI

struct RouteView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AllView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("All")
                }
            Text("Page Three")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
    
}

#Preview {
    RouteView()
}
