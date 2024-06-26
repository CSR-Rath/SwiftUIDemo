//
//  HomeView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 22/6/24.
//

import SwiftUI


struct HomeView: View {
    
    
    @State var activeDestination = false
    @State var nameMenuList: String = ""
    @State var isHideBack = false
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Profile
            HStack(spacing: 16) {
                Image(.bgBG)
                    .resizable()
                    .frame(width: 38, height: 38)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Welcome")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack{
                        Text("Sophearath Chhan")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                Image(.icNotificationRed)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            ScrollView {
                
                VStack(spacing: 10){
                    
                    UpgradeView()
                        .cornerRadius(10)
                        .frame(height: 60)
                    
                    CardView()
                        .cornerRadius(10)
                        .frame(height: 63)
                    
    
                    
                    MenuListView() { name in
                        guard let menuCategory = MenuCategory(rawValue: name) else {
                            return
                        }
                        Global.animateTappedSound()

                         activeDestination = true
                        self.nameMenuList = name
                          
                    }
                 
                    ImageSlideshow()
                        .cornerRadius(10)
                        .frame(height: 160)
                    
                    ActionMore(title: "Vouchers"){
                        print("More > Vouchers")
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            
                            ForEach(0..<(10), id: \.self) { index in
                                
                                VoucherView(touchTapGesture: {
                                    print(" index ==> : \(index)")
                                })
                                .frame(width: 140, height: 200)
                                .cornerRadius(10)
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                    
                    ActionMore(title: "Promotions"){
                        print("More > Promotions")
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            
                            ForEach(0..<(10), id: \.self) { index in
                                
                                PromotionView(touchTapGesture: {
                                    print(" index ==> : \(index)")
                                })
                                .frame(width: 140)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .foregroundColor(Color.clear)
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
            }
            .refreshable {
                print("Do your refresh work here")
            }
            .background(Color.bgMain)
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(isHideBack)
        
        .onAppear{
            isHideBack = true
            print("onAppear")
            
        }
        
        .onDisappear {
            print("onDisappear")
        }
    
        
        NavigationLink(
            destination: getDestinationView(name: nameMenuList),
            isActive: $activeDestination
        ) {
            EmptyView()
        }
    }
    
    func getDestinationView(name: String) -> AnyView {
        
        let menuCategory = MenuCategory(rawValue: name)
        
        switch menuCategory {
        case .charity:
            return AnyView(CharityView())
        case .fun:
            return AnyView(FunView())
        case .specialOffer:
            return AnyView(SpecialOfferView())
        case .travel:
            return AnyView(TravelView())
        case .wallet:
            return AnyView(WalletView())
        case .reward:
            return AnyView(RewardView())
        case .none:
            return AnyView(EmptyView())
        }
    }
    
}


//MARK: Actoin line
extension HomeView{
    
    
    
    
    //MARK: When passcode right
    
    
}
