//
//  UpgradeView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 24/6/24.
//

import SwiftUI

struct UpgradeView: View {
    
    var body: some View {
        ZStack{
            
            Image(uiImage: .bgUpgrade)
                .resizable()
                .frame(maxWidth: .infinity,maxHeight: 50)
                .cornerRadius(10)
                .clipped()
            
            HStack{
                Image(uiImage: .icUpgrade)
                    .clipped()
                    .frame(maxWidth: 60,maxHeight: 60)
                
                VStack(alignment: .leading, spacing: 0){
                    Text("UPDRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Your accountto enjoy full benifite.")
                        .foregroundColor(.white)
                        .font(.system(size: 11))
                }.padding([.bottom],3)
                
                Spacer()
                Image(uiImage: .icNextUpgrade)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 30)
                    .frame(width: 18,height: 18)
                
            }
        }
    }
}
