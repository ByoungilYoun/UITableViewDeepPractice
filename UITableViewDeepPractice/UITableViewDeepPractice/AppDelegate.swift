//
//  AppDelegate.swift
//  UITableViewDeepPractice
//
//  Created by 윤병일 on 2020/09/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let navi = UINavigationController(rootViewController: ViewController())
    window?.rootViewController = navi
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
    return true
  }
}

