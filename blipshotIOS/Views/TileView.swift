//
//  TileView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI

struct TileView: View {
    let post: Post
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ImageView(imageUrl:post.postImage)
            }
            
            VStack(alignment: .leading) {
                Image("avatar-chris")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
                    .clipShape(Circle())
                
                Text(post.userName)
                    .foregroundColor(.white)
                
                HStack {
                    Text(post.postTitle)
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "heart.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}

struct ImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "loading")! : UIImage(data: imageLoader.data)!)
            .resizable()
            .aspectRatio(3/4,contentMode: .fit)
            .cornerRadius(10)
    }
    
    func resizeImage(image:UIImage) -> UIImage{
        let width = image.size.width
        let height = image.size.height
        UIGraphicsBeginImageContext(CGSize(width:width, height: height))
        image.draw(in:CGRect(x:0, y:0, width:width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

struct TileView_Previews: PreviewProvider {
    //static let testPost:Post = Post(from: <#Decoder#>)
    static var previews: some View {
        //TileView(post:testPost)
            //.previewLayout(PreviewLayout.sizeThatFits)
            //.padding()
        Text("Fix this")
    }
}
