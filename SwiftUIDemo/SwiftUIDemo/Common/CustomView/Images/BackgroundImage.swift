//
//  BackgroundImage.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import SwiftUI

struct BackgroundImage: View {
    
    var bgImage: UIImage

    var body: some View {
        Image(uiImage: bgImage ) // Replace with your image name
            .resizable()
            .scaledToFill()
            .clipped(antialiased: true)
            .edgesIgnoringSafeArea(.all)
            
    }
}

struct BackgroundImageOpacity: View {
    
    var bgImage: UIImage
    var opacity: Double

    var body: some View {
        Image(uiImage: bgImage)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .opacity(0.8)
//            .clipped(antialiased: true)
    }
}




