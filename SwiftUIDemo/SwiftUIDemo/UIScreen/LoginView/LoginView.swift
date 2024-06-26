//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import SwiftUI

//struct GlobalState {
//    @State  static var keyboardHeight: CGFloat = 0
//}

struct LoginView: View {

    @State private var isAction: Bool = false
    @State private var phoneNumber: String = ""
    @State private var heightOnKey: CGFloat = 0
    
    
    
    var body: some View {
        ZStack {
            
            Color.gray
                .ignoresSafeArea()

            
            VStack(alignment: .center, spacing: 10) {
                Image(uiImage: .logoTheReal)
                    .resizable()
                    .font(.title)
                    .foregroundColor(.orange)
                    .frame(width: 250, height: 200)
                
                TextShadow(text: "Login", font: .title3,foregroundColor: .white )
                    .padding(.top, 30)
                    .frame(maxWidth: widthScreen, alignment: .leading)
                
                Text("Please provide your accurate phone number for application access.")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(maxWidth: widthScreen, alignment: .leading)
                
                HStack(alignment: .center, spacing: 10) {
                    TextShadow(text: "+855 ", font: .title3,foregroundColor: .white)
                    
                    TextField("Enter phone number.", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.8))
                        )
                        .keyboardType(.numberPad)
                        .frame(maxHeight: 50)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button(action: {
                                    resignFirstResponder()
                                }) {
                                    Text("Done")
                                }
                            }
                        }
                }
                .frame(maxWidth: widthScreen)
                
                Spacer()
                
                NavigationLink(
                    destination: KeyboradView(),
                    isActive: $isAction
                ) {
                    Button(action: {
                        isAction = true
                    })
                    {
                        Text("Next")
                            .frame(maxWidth: widthScreen)
                            .frame(maxHeight: 50)
                    }
                    .buttonStyle(CustomButtonStyle())
                    .offset(y: heightOnKey)
                }
                
                
            }
            .padding([.leading, .trailing], 16)
            .onAppear {
                setupKeyboardObservers()
            }
        }
    }
}


extension LoginView{
    
    func setupKeyboardObservers() {
        
        // keyborad will show
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main
        ) { notification in
            
            heightOnKey = -10
            
            //            if let _ = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            //                keyboardHeight = -10
            //            }
        }
        
        // keyborad will hide
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { _ in
            heightOnKey = 0
            
        }
    }
    
    // Resing text field
    func resignFirstResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

