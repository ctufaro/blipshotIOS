//
//  BottomNavView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI

struct BottomNavView: View {
    @ObservedObject var uiSettings:UISettings
    var body: some View {
        VStack {
            HStack {
                ToolbarButton(title: "home", icon: "house")
                    .frame(width: UIScreen.screenWidth/5.5, height: 75)
                
                ToolbarButton(title: "profile", icon: "person.fill")
                    .frame(width: UIScreen.screenWidth/5.5, height: 75)
                
                CircleButton(uiSettings: self.uiSettings, title: "camera", icon: "camera.circle.fill")
                    .offset(y: -UIScreen.screenHeight/10/2)
                
                ToolbarButton(title: "hot", icon: "flame.fill")
                    .frame(width: UIScreen.screenWidth/5.5, height: 75)
                
                ToolbarButton(title: "market", icon: "dollarsign.circle")
                    .frame(width: UIScreen.screenWidth/5.5, height: 75)
                
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/10)
            .background(Color.white)
        }
    }
}

struct ToolbarButton: View {
    let title: String
    let icon: String
    var body: some View {
        Image(systemName: icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(20)
            .foregroundColor(.black)
    }
}

struct CircleButton: View {
    @ObservedObject var uiSettings = UISettings()
    let title: String
    let icon: String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 65, height: 65)
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65, height: 65)
                .foregroundColor(.black)
                .onTapGesture {
                    self.uiSettings.currentPage = self.title
                }
        }
    }
}

struct BottomNavView_Previews: PreviewProvider {
    static var previews: some View {
        //BottomNavView()
        //.previewLayout(PreviewLayout.sizeThatFits)
        //.padding()
        Text("Fix this")
    }
}
