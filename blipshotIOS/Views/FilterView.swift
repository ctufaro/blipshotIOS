//
//  FilterView.swift
//  blipshotIOS
//
//  Created by Christopher Tufaro on 8/12/20.
//  Copyright © 2020 Christopher Tufaro. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(0..<10) { index in
                        CircleView(label: "\(index)")
                    }
                }
            }.frame(height: 100)
        }
    }
}

struct CircleView: View {
    @State var label: String
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow)
                .frame(width: 70, height: 70)
            Text(label)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
