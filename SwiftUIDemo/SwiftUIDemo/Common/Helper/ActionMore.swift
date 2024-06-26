//
//  ActionMore.swift
//  SwiftUIDemo
//
//  Created by Rath! on 24/6/24.
//

import Foundation
import SwiftUI

struct ActionMore: View {
    var title : String
    var onMoreTapped: () -> () // Add this new parameter
    
    var body: some View {
        HStack{
            Text(title)
                .font(.body)
                .fontWeight(.bold)
            Spacer()
            HStack {
                Text("More")
                    .fontWeight(.regular)
                Image(uiImage: .icNext)
                    .font(.title)
            }
            .padding()
            .foregroundColor(.black) // Set the text and icon color
            .onTapGesture {
                onMoreTapped() // Call the provided onMoreTapped closure
            }
        }
        .frame(maxHeight: 20)
    }
}
