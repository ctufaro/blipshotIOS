//
//  ContentView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/4/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        if(userSettings.loggedIn){
            return AnyView(HomeView())
        } else {
            return AnyView(LoginView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
