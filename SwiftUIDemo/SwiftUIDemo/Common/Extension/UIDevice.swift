//
//  UIDevice.swift
//  SwiftUIDemo
//
//  Created by Rath! on 21/6/24.
//

import SwiftUI
import AudioToolbox

extension UIDevice{
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        print("Vibrated")
    }
}
