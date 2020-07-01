//
//  TabBarView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "sheetBackgroundColor")
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill").imageScale(.large)
                    Text("Tasks")
            }
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis.circle").imageScale(.large)
                    Text("More")
            }
        }.accentColor(Color("gradient2"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
