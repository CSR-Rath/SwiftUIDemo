//
//  MenuListView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 24/6/24.
//

import SwiftUI


struct GridMenuItemBigView: View {
    
    var touchGesture : ()-> ()
    var title: String
    var subtitle: String
    var image: UIImage
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            Text(title)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
            Text(subtitle)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            Spacer()
            HStack{
                Spacer()
                Image(.icWallet)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 10))
            }
        }
        .padding(0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fit) // Set the aspect ratio to 1:1
        .cornerRadius(10)
        .background(Color.white)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 0) // main shadow
        
        .onTapGesture {
            touchGesture()
        }
    }
}

struct GridMenuItemSmallView: View {
    
    var touchGesture : ()-> ()
    var title: String
    var image: UIImage
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(.icFun)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            Text(title)
                .font(.system(size: 10.5))
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0))
        }
        .padding(0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fit) // Set the aspect ratio to 1:1
        .cornerRadius(10)
        .background(Color.white)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 0) // main shadow
        .onTapGesture {
            touchGesture()
        }
    }
}

struct MenuListView: View {
    
    var touchMenuList: (String)->()
    
    private let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    private let fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible())
                                  , GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    private let title4: [String] = [MenuCategory.fun.rawValue,
                                    MenuCategory.specialOffer.rawValue,
                                    MenuCategory.travel.rawValue,
                                    MenuCategory.charity.rawValue
    ]
    
    let list2 : [TitleSubtitleAndImageModel] = [
        
        TitleSubtitleAndImageModel(title: MenuCategory.wallet.rawValue, subtitle: "Manage Wallet",
                                   imagename: .icFun),
        TitleSubtitleAndImageModel(title: MenuCategory.reward.rawValue, subtitle: "Check Reward",
                                   imagename: .icFun)
    ]
    
    let list4 : [TitleAndImageModel] = [
        
        TitleAndImageModel(title: MenuCategory.fun.rawValue,
                           imagename: .icFun),
        TitleAndImageModel(title: MenuCategory.specialOffer.rawValue,
                           imagename: .icFun),
        TitleAndImageModel(title: MenuCategory.travel.rawValue,
                           imagename: .icFun),
        TitleAndImageModel(title: MenuCategory.charity.rawValue,
                           imagename: .icFun)
    ]
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack(spacing: 15) {
                ForEach(0..<(list2.count), id: \.self) { index in
                    let data = list2[index]
                    GridMenuItemBigView(touchGesture: {
                        touchMenuList(data.title)
                    }, title: data.title, subtitle: data.subtitle, image: data.imagename)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            HStack(spacing: 15) {
                ForEach(0..<(list4.count), id: \.self) { index in
                    let data = list4[index]
                    GridMenuItemSmallView(touchGesture: {
                        touchMenuList(data.title)
                    }, title: data.title, image: data.imagename)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        
    }
}


