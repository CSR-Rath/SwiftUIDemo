//
//  WalletView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 25/6/24.
//

import SwiftUI

struct WalletView: View {
    
    
    var title: String = "STARBUCKS(*1168)"
    var subtitle: String = "Your transaction at Starbucks reflects a deduction."
    var date: String = "01/12/2024"
    var type: ValueType  = ValueType(rawValue: "") ?? .CASH
    
    var body: some View {
        
        
        List{
            
            ForEach(0..<100, id: \.description){ index in
                TransactionHistoryView(title: title,
                                       subtitle: subtitle,
                                       date: date,
                                       pointColor: .green,
                                       valueType: type.rawValue,
                                       valueNumber: "\(index).00")
                .listRowSeparator(.hidden) // hide line
                .lineSpacing(0)
                .listRowSpacing(0)
                .background(Color.clear)
                .listRowBackground(Color.clear) // set color call
                }
            
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .lineSpacing(0)
            .background(Color.bgMain)
    }
}



struct TransactionHistoryView: View {
    
    let  title: String
    let  subtitle: String
    let  date: String
    let  pointColor: Color
    let  valueType: String
    let  valueNumber: String
    
    var body: some View {
        
        ZStack{
            HStack(spacing: 10) {
                ZStack{
                    Image(.bgBG)
                        .resizable()
                        .frame(width:  50, height: 50)
                        .cornerRadius(25)
                        .clipped()
                    
                    Image(.bgChoice)
                        .resizable()
                        .frame(width:  15, height: 15)
                        .cornerRadius(15/2)
                        .clipped()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                    Text(subtitle)
                        .font(.system(size: 10))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    HStack(spacing: 2){
                        Text(valueNumber)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(pointColor)
                        Text(valueType)
                            .font(.system(size: 10))
                    }
                    
                    Text(date)
                        .font(.system(size: 10))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        .padding(0)
        .frame(height: 80)
        .background(Color.white)
        .cornerRadius(10)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: -16, trailing: 0)) // 28
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 0) // main shadow
        
    }
}
