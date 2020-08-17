//
//  LoginView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI
//import FloatingLabelTextFieldSwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        ZStack {
            Image("black-background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo-white")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.top,.leading,.trailing], UIScreen.screenWidth/5)
                /*TextBoxView(email:self.$email, width: UIScreen.screenWidth, placeTxt: "Email", isSecure: false)
                TextBoxView(email:self.$password, width: UIScreen.screenWidth, placeTxt: "Password", isSecure: true)*/
                Button(action: {
                    self.userSettings.loggedIn = true
                }) {
                    Text("Enter")
                        .padding()
                        .foregroundColor(Color.white)
                }
                .background(Capsule()
                .stroke(lineWidth: 2)
                .frame(width:UIScreen.screenWidth/1.5)
                .foregroundColor(Color.white))
                .padding(30)
                Spacer()
                Text("Need an account?")
                    .foregroundColor(Color.white)
                    .padding(40)
            }
        }
    }
}

/*struct TextBoxView: View {
    @Binding var email:String
    var width:CGFloat
    var placeTxt:String
    var isSecure:Bool
    
    var body: some View {
        FloatingLabelTextField(self.$email, placeholder: placeTxt, editingChanged: { (isChanged) in
            
        }) {
            
        }
        .isSecureTextEntry(isSecure)
        .lineColor(.white)
        .titleColor(.white)
        .selectedLineColor(.white)
        .selectedTextColor(.white)
        .selectedTitleColor(.white)
        .textColor(.white)
        .placeholderColor(.white)
        .frame(width: width/1.5, height: 70)
        
    }
}*/



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE 2"))
                .previewDisplayName("iPhone SE 2")
            
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
                .previewDisplayName("iPhone 8 Plus")
            
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
