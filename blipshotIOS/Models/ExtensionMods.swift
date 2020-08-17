//
//  Extensions.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//
import SwiftUI
import Foundation

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("")//, displayMode: .inline)
        .navigationBarHidden(true)
    }
}


