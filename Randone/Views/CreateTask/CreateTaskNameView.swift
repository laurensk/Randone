//
//  CreateTaskNameView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct CreateTaskNameView: View {
    
    @Binding var currentView: ParentViews
    @Binding var newTask: Task
    
    @State private var taskNameText = ""
    @State private var showEmptyNameAlert = false
    
    var body: some View {
        ZStack {
            RandoneHeaderView("Create a Task", "Give your task a name")
            
            VStack {
                ForEach(1...3, id: \.self) { i in
                    Spacer()
                }
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .leading) {
                        if taskNameText.isEmpty {
                            Text("What’s your goal?").foregroundColor(Color("placeholderTextColor"))
                                .fontWeight(.light)
                                .font(.callout)
                                .padding(EdgeInsets(top: 10, leading: 32, bottom: 10, trailing: 32))
                                .overlay(RoundedRectangle(cornerRadius: 37).stroke(Color.white, lineWidth: 0))
                                .padding(.bottom, 12)
                        }
                        
                        TextField("", text: $taskNameText)
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 10, leading: 32, bottom: 10, trailing: 32))
                            .overlay(RoundedRectangle(cornerRadius: 37).stroke(Color.white, lineWidth: 0.7))
                            .padding(.bottom, 12)
                        
                    }
                    
                    Button(action: {
                        self.nextButtonTapped()
                    }) {
                        Text("Next")
                            .fontWeight(.medium)
                            .padding(EdgeInsets(top: 10.5, leading: 35, bottom: 10.5, trailing: 35))
                            .foregroundColor(.white)
                            .background(Color("appGradient"))
                            .cornerRadius(37)
                    }
                    
                }.padding(.leading, 33).padding(.trailing, 42)
                ForEach(1...4, id: \.self) { i in
                    Spacer()
                }
            }
        }.alert(isPresented: $showEmptyNameAlert) {
            Alert(title: Text("No name entered"), message: Text("Please give your new task a name."), dismissButton: .default(Text("Got it")))
        }
    }
    
    func nextButtonTapped() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
        if !taskNameText.isEmpty {
            newTask = Task(uuid: UUID(), title: taskNameText, notes: "")
            withAnimation {
                currentView = .CreateTaskNotes
            }
        } else {
            self.showEmptyNameAlert.toggle()
        }
    }
    
}
