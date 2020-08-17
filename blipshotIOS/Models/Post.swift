//
//  Post.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import Foundation
struct Post: Decodable, Identifiable {
    let id: Int32
    let postTitle, postImage, userName, postMotion: String
    
    init(){
        self.id = 1
        self.postTitle = "Test Post"
        self.postImage = "avatar-chris"
        self.userName = "@preview"
        self.postMotion = "motion"
    }
}
