//
//  CreateTaskNotesView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct CreateTaskNotesView: View {
    
    @Binding var currentView: ParentViews
    @Binding var newTask: Task
    
    @State private var taskNotesText = ""
    
    var body: some View {
        ZStack {
            RandoneHeaderView("Create a Task", "You may add a note")
            
            VStack {
                ForEach(1...4, id: \.self) { i in
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    ZStack(alignment: .topLeading) {
                        if taskNotesText.isEmpty {
                            Text("Add notes…")
                                .foregroundColor(Color("placeholderTextColor"))
                                .font(.system(size: 16))
                                .multilineTextAlignment(.leading)
                                .padding(EdgeInsets(top: 22, leading: 30, bottom: 15, trailing: 25))
                        }
                        RandoneTextView(text: $taskNotesText, dismissOnReturn: false)
                            .frame(height: 180)
                            .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                    }
                    .padding(.bottom, 12)
                    
                    Button(action: {
                        self.nextButtonTapped()
                    }) {
                        HStack {
                            Spacer()
                            
                            Text("Save Task")
                                .fontWeight(.medium)
                                .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .background(Color("appGradient"))
                        .cornerRadius(37)
                        
                    }
                    .padding(EdgeInsets(top: 0, leading: 22, bottom: 22, trailing: 22))
                    
                }.overlay(RoundedRectangle(cornerRadius: 37).stroke(Color.white, lineWidth: 0.7))
                    .padding(.leading, 22).padding(.trailing, 22)
                
                
                ForEach(1...5, id: \.self) { i in
                    Spacer()
                }
            }
        }
    }
    
    func nextButtonTapped() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
        newTask.notes = taskNotesText
        
        TaskData.saveTask(task: newTask)
        
        // dismiss the adding sheet
        withAnimation {
            currentView = .Home
        }
        
    }
    
}
