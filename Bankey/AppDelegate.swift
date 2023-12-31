//
//  AppDelegate.swift
//  Bankey
//
//  Created by Eng. Motlaq Alnassafi on 16/10/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController =  OnboardingContainerViewController() //LoginViewController()
        
        return true
    }

}

