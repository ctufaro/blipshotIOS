//
//  HomeView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var uiSettings = UISettings()
    var body: some View {
        ZStack {
            if uiSettings.currentPage == "home" {
                Group {
                    // TOP NAVIGATION VIEW
                    if self.uiSettings.showTopNav {
                        VStack {
                            TopNavView()
                            Spacer()
                        }.zIndex(1.0)
                    }
                    // GALLERY VIEW
                    GalleryView(uiSettings:uiSettings)
                    // BOTTOM NAVIGATION VIEW
                    if self.uiSettings.showToolBar {
                        VStack {
                            Spacer()
                            BottomNavView(uiSettings:uiSettings)
                        }.edgesIgnoringSafeArea(.bottom)
                    }
                }
            }
            else if uiSettings.currentPage == "camera"{
                Group{
                    CameraView(uiSettings: self.uiSettings)
                    .transition(.scale)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE 2"))
                .previewDisplayName("iPhone SE 2")
            
            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
                .previewDisplayName("iPhone 8 Plus")
            
            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
