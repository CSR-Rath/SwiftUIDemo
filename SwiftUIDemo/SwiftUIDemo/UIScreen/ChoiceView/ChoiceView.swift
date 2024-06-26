//
//  ChoiceView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import Foundation
import SwiftUI

struct ChoiceView: View {
    
    @State var isActiveLogin = false
    @State var isActiveRegister = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {

            
            BackgroundImage(bgImage: .bgChoice)

            
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                
                TextShadow(text: "Login or register system.", font: .body)
                    .frame(width: widthScreen,alignment: .leading)
                
                Text("Join the Rial Card together to promote Cambodia towards a new future. You can choose to access or register a new one here.")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(width: widthScreen,alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 60, trailing: 0))
                
                
                NavigationLink(
                    destination: LoginView(),
                    isActive: $isActiveLogin) {
                        Button(action: {
                            isActiveLogin = true
                        }) {
                            Text("Login")
                                .frame(maxWidth: widthScreen)
                                .frame(maxHeight: 50)
                        }
                        .buttonStyle(CustomButtonStyle())
                    }
                
                NavigationLink(
                    destination: KeyboradView(),
                    isActive: $isActiveRegister
                ) {
                    Button(action: {
                        isActiveRegister = true
                    }) {
                        Text("Register")
                            .frame(maxWidth: widthScreen)
                            .frame(maxHeight: 50)
                    }
                    .buttonStyle(CustomButtonStyle())
                }
                .padding(.bottom,20)
                
            }
            .padding(.bottom,20)
            
        }
        .navigationBarBackButtonHidden()
    }
}










