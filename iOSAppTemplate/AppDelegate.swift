//
//  AppDelegate.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 17/06/22.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

