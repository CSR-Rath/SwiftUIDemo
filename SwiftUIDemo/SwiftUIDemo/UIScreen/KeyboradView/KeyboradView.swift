//
//  KeyboradView.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import SwiftUI

struct KeyboradView: View {
    
    @State private var display = ""
    // for view circle
    let numCircles = 6
    let circleSize: CGFloat = 20
    @State private var isPressed: [Bool] = Array(repeating: false, count: 6)
    
    @State private var isShaking = false
    @State private var isLeft: CGFloat = 0
    
    
    
    private let data = [["1","2", "3"],
                        ["4", "5", "6"],
                        ["7", "8", "9"],
                        ["", "0", "Delete"],
    ]
    
    var body: some View {
        let margin: CGFloat = 20
        let buttonSize: CGFloat = 80
        let width = UIScreen.main.bounds.width
        
        
        VStack(alignment: .center) {
            Spacer()
            HStack(spacing: 15) {
                Spacer()
                // Set circle range
                ForEach(0..<6) { index in
                    Circle()
                        .fill(isPressed[index] ? Color.orange : Color.clear)
                        .frame(width: circleSize, height: circleSize)
                        .overlay(
                            Circle()
                                .stroke(Color.orange, lineWidth: 1.5)
                        )
                        .offset(x: isShaking ? 10 : isLeft)
                        .onAppear {
                            startShakingAnimation()
                        }
                }
                Spacer()
            }
            
            Spacer()
            VStack(alignment: .center, spacing: 15) {
                ForEach(data, id: \.description) { items in
                    HStack(alignment: .center, spacing: margin) {
                        ForEach(items, id: \.description) { item in
                            if item == "Delete" {
                                Button(action: {
                                    // Handle delete action
                                    touchActionDelete(item)
                                }) {
                                    Image(systemName: "delete.left")
                                        .font(.title)
                                        .frame(width: buttonSize, height: buttonSize)
                                        .foregroundColor(Color.orange)
                                    
                                }
                            } else {
                                Button(action: {
                                    self.touchNumberAction(item)
                                }) {
                                    Text(item)
                                        .font(.title)
                                        .bold()
                                        .frame(width: buttonSize, height: buttonSize)
                                        .foregroundColor(item == "" ? Color.clear : Color.orange)
                                        .background(
                                            RoundedRectangle(cornerRadius: buttonSize / 2)
                                                .fill(item == "" ? Color.clear : Color.white)
                                                .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 3)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: buttonSize / 2)
                                                .stroke(item == "" ? Color.clear : Color.orange, lineWidth: 2)
                                        )
                                }
                            }
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 0,
                                leading: (width - (buttonSize * 3 + margin * 2)) / 2,
                                bottom: 0,
                                trailing: (width - (buttonSize * 3 + margin * 2)) / 2))
            Spacer()
        }
        
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        
    }
    
    
    
}



extension KeyboradView{
    
    // MARK: touch button delete
    private func touchActionDelete(_ symbol: String) {
        Global.animateTappedSound()
        
        if !display.isEmpty {
            display.removeLast()
            isPressed[display.count] = false
            
        } else {
            print("Empty data")
        }
    }
    
    // MARK: conditions in urrect passcodes
    private func inCurrectPasscode(){
        isLeft = -10
        startShakingAnimation()
        UIDevice.vibrate()
        display.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPressed[0] = false
            isPressed[1] = false
            isPressed[2] = false
            isPressed[3] = false
            isPressed[4] = false
            isPressed[5] = false
            stopShakingAnimation()
        }
    }
    
    // MARK: enter number
    private func touchNumberAction(_ symbol: String) {
        
        if display.count < numCircles && symbol != "" && isShaking == false  {
            
            display.append(symbol)
            isPressed[display.count - 1] = true
            
            if display.count == 6{
                print("Complete passcodes")
                if display == "111111"{
                    print("Passcodes Currect.")
                }else{
                   
                    inCurrectPasscode()
                }
            }
            
            Global.animateTappedSound()
        }else if display.count == 6 {
            print("The passcodes are Completed.")
        }
    }
    
    // MARK: startShakingAnimation
    private func startShakingAnimation() {
        withAnimation(Animation.linear(duration: 0.1).repeatForever(autoreverses: true)) {
            isShaking.toggle()
        }
    }
    
    // MARK: stopShakingAnimation
    private func stopShakingAnimation() {
        withAnimation(Animation.linear(duration: 0.1)) {
            isShaking = false
            isLeft = 0
        }
    }
}



struct Calculator_Previews : PreviewProvider {
    static var previews: some View {
        KeyboradView()
    }
}





