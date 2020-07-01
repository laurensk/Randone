//
//  HomeTaskView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct HomeTaskView: View {
    
    @ObservedObject var task: Task
    
    @State private var taskNotes: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            
            RoundedRectangle(cornerRadius: 20).fill(Color("buttonGradient"))
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Current Task:")
                        .foregroundColor(Color("mainTextColor"))
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                        .padding(.top, 5)
                    Text(task.title ?? "Untitled Task")
                        .foregroundColor(Color("mainTextColor"))
                        .fontWeight(.semibold)
                        .font(.system(size: 27))
                        .padding(.top, 8)
                    Text("Notes:")
                        .foregroundColor(Color("mainTextColor"))
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                        .padding(.top, 22)
                    
                }.padding(.leading, 10)
                
                ZStack(alignment: .topLeading) {
                    
                    RoundedRectangle(cornerRadius: 20).fill(Color.white).opacity(0.28)
                    
                    ZStack(alignment: .topLeading) {
                        if taskNotes.isEmpty {
                            Text("Take notes...")
                                .foregroundColor(Color("mainTextColor"))
                                .fontWeight(.medium)
                                .font(.system(size: 15))
                                .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
                        }
                        RandoneTextView(text: $taskNotes, dismissOnReturn: true)
                            .padding(EdgeInsets(top: 7, leading: 15, bottom: 0, trailing: 15))
                    }
                    
                }
                
            }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            
        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .onAppear {
            if let notes = self.task.notes {
                self.taskNotes = notes
            }
        }
    }
}
