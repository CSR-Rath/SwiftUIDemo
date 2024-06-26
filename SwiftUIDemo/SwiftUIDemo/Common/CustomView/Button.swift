//
//  Button.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import Foundation
import SwiftUI


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
         configuration.label
//             .padding([.top,.bottom],15)
             .background(Color.orange)
             .foregroundColor(.white)
             .font(.system(size: 17, weight: .medium))
             .opacity(configuration.isPressed ? 0.5 : 1)
             .cornerRadius(10)
             .overlay(
                 RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
             )

     }
}
