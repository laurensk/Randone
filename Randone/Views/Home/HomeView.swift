//
//  HomeView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

public enum ButtonTextStrings: String {
    case TaskActive = "Done"
    case NoTaskActive = "Choose Random Task"
}

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.creationDate, ascending: false)]
    ) var fetchedTasksUndone: FetchedResults<Task>
    
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.creationDate, ascending: false)]
    ) var fetchedTasksDone: FetchedResults<Task>
    
    @State private var isTaskActive: Bool = false
    @State private var currentTask: Task? = nil
    @State private var buttonText: String = ButtonTextStrings.NoTaskActive.rawValue
    
    @State private var showNotEnoughTasksAlert: Bool = false
    
    var body: some View {
        ZStack {
            RandoneHeaderView("Randone", "The random task app")
            
            VStack {
                Spacer()
                ZStack(alignment: .top) {
                    
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color("sheetBackgroundColor"))
                    
                    VStack {
                        
                        // Top Content
                        HomeTaskCountView(tasksCount: fetchedTasksUndone.count, doneCount: fetchedTasksDone.count)
                        
                        Spacer()
                        
                        // Center Content
                        if isTaskActive {
                            HomeTaskView(task: currentTask!).transition(.move(edge: .bottom))
                        } else {
                            if fetchedTasksUndone.count >= 2 {
                                HomeMessageView(message: "When you’re ready to be productive, let\nthe fortune choose one of your tasks…")
                            } else {
                                HomeMessageView(message: "Welcome to Randone!\nLet’s get started by adding at least two tasks.")
                            }
                        }
                        
                        Spacer()
                        
                        // Bottom Content
                        HomeButtonsView(chooseRandomTaskAction: self.chooseRandomTask, createTaskAction: self.createTask, buttonText: $buttonText)
                        
                    }
                }.frame(height: 580)
            }
        }.alert(isPresented: $showNotEnoughTasksAlert) {
            Alert(title: Text("Not enough tasks"), message: Text("Please add at least two tasks to get started."), dismissButton: .default(Text("Got it")))
        }
    }
    
    func chooseRandomTask() {
        if isTaskActive {
            currentTaskDone()
        } else {
            if TaskData.tasks.count >= 2 {
                getRandomTask()
            } else {
                self.showNotEnoughTasksAlert.toggle()
            }
        }
        
    }
    
    func currentTaskDone() {
        if let currentTask = currentTask {
            TaskData.markTaskAsDone(task: currentTask)
            
            withAnimation {
                self.isTaskActive = false
            }
            
            self.currentTask = Task()
            
            self.buttonText = ButtonTextStrings.NoTaskActive.rawValue
        }
    }
    
    func getRandomTask() {
        self.currentTask = TaskData.getRandomUndoneTask()
        
        withAnimation {
            self.isTaskActive = true
        }
        
        self.buttonText = ButtonTextStrings.TaskActive.rawValue
    }
    
    func createTask() {
        withAnimation {
            currentView = .CreateTaskName
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
