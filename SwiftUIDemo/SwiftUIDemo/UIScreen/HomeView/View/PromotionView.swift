//
//  PromotionView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 24/6/24.
//

import SwiftUI

struct PromotionView: View {
    var touchTapGesture: ()->()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Image(.bgBG)
                .resizable()
                .frame(height: 90)
                .frame(maxWidth: .infinity)
            
            ZStack{
                
                Image(.bgVoucher)
                    .resizable()
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                
                HStack{
                    
                    // Group Dinners
                    Text("Group dinners of 5 or more.")
                        .font(.system(size: 11))
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .center, spacing: 0){
                        // Amount
                        Text("Amount")
                            .font(.system(size: 11))
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("500 USD")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }.padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 3))
            }
            .padding(.top,-5)
            .frame(height: 45)
            
            
            HStack{
                Circle()
                    .fill(Color.bgMain)
                    .frame(width: 16, height: 16)
                    .padding(.leading, -8)
                
                Spacer()
                
                Circle()
                    .fill(Color.bgMain)
                    .frame(width: 16, height: 16)
                    .padding(.trailing, -8)
            }.padding(.top, -53)
            
            
            Spacer()
            VStack(alignment: .leading, spacing: 3){
                Text("APPLE")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 0)
                HStack{
                    Text("Remain :")
                        .font(.system(size: 11))
                        .foregroundColor(.black)
                    Text("500")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                
                Text("Expire : 30 Dec 2024")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .padding(.bottom,10)
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 5, trailing: 0))
        }
        .background(
            Global.mainShadow(corner: 10)
        )
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .onTapGesture {
            touchTapGesture()
        }
        
    }
}

