//
//  Global.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import UIKit
import SwiftUI

class Global{

    static func animateTappedSound(){
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
    
    
    static func mainShadow(corner: CGFloat ) -> some View{
        
        let shadowedView = RoundedRectangle(cornerRadius: corner)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(1), radius: 3, x: 0, y: 3)
        return shadowedView
    }
    
    
}


