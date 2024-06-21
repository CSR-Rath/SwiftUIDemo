//
//  Global.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import UIKit

class Global{

    static func animateTappedSound(){
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
    
}
