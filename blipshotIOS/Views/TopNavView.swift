//
//  LogoView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI

struct TopNavView: View {
    var body: some View {
        ZStack{
            HStack(alignment: .center) {
                Spacer()
                Image("logo-black")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:UIScreen.screenWidth/3)
                Spacer()
            }
            HStack(alignment: .center){
                Spacer()
                Image(systemName: "power")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .frame(width:UIScreen.screenWidth/15)
            }.padding(.trailing,10)
        }
        .padding(.top,35)
        .padding(.bottom,5)
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
