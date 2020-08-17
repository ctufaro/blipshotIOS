//
//  NetworkManager.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/6/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    @Published var posts = [Post]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://kickshowapi.azurewebsites.net/api/userpost") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            let courses = try! JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                self.posts = courses
            }
            print("completed fetching json")
            
        }.resume()
    }
}
