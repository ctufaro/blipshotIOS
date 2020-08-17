//
//  GalleryView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI

struct GalleryView : View {
    @ObservedObject var uiSettings:UISettings
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            NavigationView {
                List (networkManager.posts) { post in
                    NavigationLink(
                        destination:VideoPlayerView(uiSettings:self.uiSettings,myVidUrl: post.postMotion))
                    {
                        TileView(post: post)
                    }
                }
                .hiddenNavigationBarStyle()
                .onAppear(){
                    self.uiSettings.showToolBar = true
                    self.uiSettings.showTopNav = true
                    UITableView.appearance().separatorStyle = .none
                }
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        //GalleryView()
        Text("Fix this")
    }
}
