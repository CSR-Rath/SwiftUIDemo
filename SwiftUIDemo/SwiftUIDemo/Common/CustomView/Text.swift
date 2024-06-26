//
//  Text.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import Foundation
import SwiftUI



struct TextShadow: View {
    var text: String
    var font: Font? = .title3
    var foregroundColor: Color = .white
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(.bold)
            .foregroundColor(foregroundColor)
            .shadow(color: 
                        foregroundColor == .black ? Color.white.opacity(0.5) :
                        Color.black.opacity(0.5),
                        radius: 2, x: 0, y: 2)
    }
}

struct Action: View {


    var title: String
    
    @State var isAction: Bool = false
    
    var body: some View {
        
        Text(title)
            .font(.system(size: 17, weight: .medium))
            .foregroundColor(.white)
            .frame(maxWidth: widthScreen)
            .frame(maxHeight: 50)
            .padding(0)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orange)
            )
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                isAction = true
            }
    }
}




