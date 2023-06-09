//
//  AppDelegate.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import UIKit
import UserNotifications
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.notificationCenter.requestAuthorization(options: [.alert, .sound, .alert]) { granted, error in
                guard granted, error == nil else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    // Ваш код, который будет вызван с задержкой в 5 секунд

                    self.notificationCenter.getNotificationSettings { (settings) in
                        print(settings)
                        guard settings.authorizationStatus == .authorized else { return }
                    }
                }
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

