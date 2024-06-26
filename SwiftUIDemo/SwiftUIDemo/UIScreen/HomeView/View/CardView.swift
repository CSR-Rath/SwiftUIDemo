//
//  CardView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 24/6/24.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        ZStack{
            
            Image(uiImage: .bgUpgrade)
                .resizable()
                .frame(maxWidth: .infinity,maxHeight: 63)
                .cornerRadius(10)
                .clipped()
            
            HStack{
                
                VStack(alignment: .leading, spacing: 0){
                    
                    HStack{
                        Text("MEMBER ID")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Text("000 000 001")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Spacer()
                        Text("Platinum")
                            .fontWeight(.bold)
//                            .font(.)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                    HStack{
                        Text("Point")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Text("6,000")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                    
                }.padding()
            }
        }
    }
}
