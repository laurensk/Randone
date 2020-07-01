//
//  RandoneHeaderView.swift
//  Randone
//
//  Created by Laurens on 01.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct RandoneHeaderView: View {
    
    var title: String
    var subtitle: String
    
    private var randoneIcon = UIImage(named: "randone_icon")
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(title).foregroundColor(Color("mainTextColor")).fontWeight(.semibold)
                        .font(.system(size: 21)).padding(.bottom, 1)
                    Text(subtitle).foregroundColor(Color("mainTextColor")).fontWeight(.light)
                        .font(.system(size: 17))
                }.padding(.top, 65)
                Spacer()
                VStack {
                    Image(uiImage: randoneIcon!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 140)
                }
            }.padding(.leading, 40)
            Spacer()
        }
    }
}
