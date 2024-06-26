//
//  WelcomeView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import SwiftUI

let widthScreen: CGFloat = UIScreen.main.bounds.width-32
let fulScreen: CGFloat = UIScreen.main.bounds.width-32

struct WelcomeView: View {
    @State var isAction : Bool = false
    
    var body: some View {
        ZStack {
            
            BackgroundImage(bgImage: .bgWelcome)
            
            NavigationLink(
                destination: ChoiceView(),
                isActive: $isAction
            ) {
                Button(action: {
                    isAction = true
                    print("Start Now")
                    
                }) {
                    Text("Start Now!")
                        .frame(maxWidth: widthScreen, alignment: .center)
                        .frame(maxHeight: 50)
                }
                .buttonStyle(CustomButtonStyle())
            }
            .padding([.top],60)
            .padding(.bottom,20)
            
        }
        
    }
}


//            VStack {
//                Spacer()
//                Image(uiImage: .logoTheReal )
//                    .resizable()
//                    .font(.title)
//                    .foregroundColor(.blue)
//                    .frame(width: 140, height: 110,alignment: .center)
//                    .padding(.bottom, 35 )
//                Spacer()
//
//                TextShadow(text: "Welcome to", font: .body)
//                TextShadow(text: "The Real Reward", font: .title)
//
//                NavigationLink(
//                    destination: ChoiceView(),
//                    isActive: $isAction
//                ) {
//                    Button(action: {
//                        isAction = true
//                        print("Start Now")
//
//                    }) {
//                        Text("Start Now!")
//                            .frame(maxWidth: widthScreen, alignment: .center)
//                            .frame(maxHeight: 50)
//                    }
//                    .buttonStyle(CustomButtonStyle())
//                }
//                .padding([.top],60)
//                .padding(.bottom,20)
//            }
//            .padding()
