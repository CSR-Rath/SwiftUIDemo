//
//  SceneDelegate.swift
//  SwiftUIDemo
//
//  Created by Rath! on 20/6/24.
//

//import UIKit
import SwiftUI

//@available(iOS 16.0, *)
class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
        print("SceneDelegate is connected!")
        
        
        let rootView = WalletView()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: rootView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        
        
//        let rootView = WelcomeView()
//        
//        if let windowScene = scene as? UIWindowScene {
//            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = UIHostingController(rootView: rootView)
//            self.window = window
//            window.makeKeyAndVisible()
//        }
    }
}
