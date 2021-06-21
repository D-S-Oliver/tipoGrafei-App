//
//  AppDelegate.swift
//  CaciqueAppZero
//
//  Created by Bruno Neves Oliveira on 15/06/21.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureAppearance()
        
        return true
      }
      
      func configureAppearance() {
        UISearchBar.appearance().tintColor = .tipoGrafeiRed
        UINavigationBar.appearance().tintColor = .tipoGrafeiRed
      }
    }


    // MARK: UISceneSession Lifecycle



