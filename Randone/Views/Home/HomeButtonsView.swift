//
//  HomeButtonsView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct HomeButtonsView: View {
    
    var chooseRandomTaskAction: () -> Void
    var createTaskAction: () -> Void
    @Binding var buttonText: String
    
    var body: some View {
        HStack {
            Button(action: {
                self.chooseRandomTaskAction()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(Color("buttonGradient"))
                    Text(buttonText).fontWeight(.semibold).foregroundColor(Color("mainTextColor"))
                }
            }.padding(.trailing, 10)
            
            Button(action: {
                self.createTaskAction()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(Color("buttonGradient"))
                    Image(systemName: "plus").resizable().font(.headline).frame(width: 22, height: 22).foregroundColor(Color("mainTextColor"))
                }
                }.frame(width: 70)
            
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
            .frame(height: 100)
    }
}
