//
//  AppDelegate.swift
//  Favorite
//
//  Created by Azizbek Musurmonov   on 19/03/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = .init(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window?.rootViewController = UINavigationController(rootViewController: FavoriteViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}
