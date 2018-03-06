//
//  AppDelegate.swift
//  SimpleArchitectureExample
//
//  Created by Mateusz Małek on 06.03.2018.
//  Copyright © 2018 Mateusz Małek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    let navigationController = UINavigationController()
    let useCases = FakeDatabaseProvider()
    let exampleFlowController = ExampleFlowController(useCases: useCases, navigationController: navigationController)
    
    window.rootViewController = navigationController
    ThemeManager.shared.changeStyle()
    
    try? exampleFlowController.to(scene: .start)
    self.window = window
    return true
  }
}
