//
//  PlayerView.swift
//  KickShow
//
//  Created by Christopher Tufaro on 5/13/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation

struct VideoPlayerView: View {
    @ObservedObject var uiSettings:UISettings
    @State private var showingSheet = true
    var myVidUrl: String
    var body: some View {
        ZStack {
            PlayerView(vidUrl: myVidUrl)
                .onAppear(){
                    self.uiSettings.showToolBar = false
                    self.uiSettings.showTopNav = false
            }
            VStack{
                Image("logo-black")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:UIScreen.screenWidth/3)
                    .padding(.top,35)
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.right.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                        .foregroundColor(.white)
                        .padding()
                    Image(systemName: "heart.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MyPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        //VideoPlayerView(myVidUrl: "https://tufarostorage.blob.core.windows.net/kickspins/display.mp4")
        Text("Fix this")
    }
}

struct PlayerView: UIViewRepresentable {
    let vidUrl:String
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(vidUrl: vidUrl)
    }
}

class PlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: NSObject?
    
    init(vidUrl:String) {
        super.init(frame: .zero)
        let url = URL(string: vidUrl)!
        let playerItem = AVPlayerItem(url: url)
        let player = AVQueuePlayer(items: [playerItem])
        let affineTransform = CGAffineTransform(rotationAngle: (.pi*90)/180.0)
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        playerLayer.setAffineTransform(affineTransform)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player.play()
        playerLayer.player = player
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
}
