//
//  HomeMessageView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct HomeMessageView: View {
    
    var message: String
    
    private var randoneDice = UIImage(named: "randone_dice")
    
    var body: some View {
        VStack {
            Image(uiImage: randoneDice!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            
            Text(message)
                .fontWeight(.medium)
                .lineLimit(nil)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("blueTextColor"))
                .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 20))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
