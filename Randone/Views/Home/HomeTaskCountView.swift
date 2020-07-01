//
//  HomeTaskCountView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct HomeTaskCountView: View {
    
    var tasksCount: Int
    var doneCount: Int
    
    var body: some View {
        HStack {
            Text("\(tasksCount)").fontWeight(.semibold)
            Text("Tasks in Randone").fontWeight(.light)
            Spacer()
            Text("\(doneCount)").fontWeight(.semibold)
            if doneCount == 1 {
                Text("Task Done").fontWeight(.light)
            } else {
                Text("Tasks Done").fontWeight(.light)
            }
        }.padding(EdgeInsets(top: 24, leading: 35, bottom: 0, trailing: 35))
            .font(.system(size: 14))
            .foregroundColor(Color("secondaryTextColor"))
    }
}
