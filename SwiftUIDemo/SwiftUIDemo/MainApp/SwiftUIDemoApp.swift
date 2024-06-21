//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Rath! on 20/6/24.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
           
        }
    }
}
