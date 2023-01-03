//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {

        let appSearchVC = configureAppSearchController()
        let songSearchVC = configureSongsSearchController()

        let tabsVC = UITabBarController()
        tabsVC.setViewControllers([appSearchVC, songSearchVC], animated: false)

        window?.rootViewController = tabsVC
        window?.makeKeyAndVisible()
    }

    private func configureAppSearchController() -> UIViewController {
        let appSearchVC = SearchAppModuleBuilder.build()
        appSearchVC.navigationItem.title = "Search via iTunes"

        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        navVC.viewControllers = [appSearchVC]
        navVC.title = "Apps"
        return navVC
    }

    private func configureSongsSearchController() -> UIViewController {
        let songSearchVC = SearchSongModuleBuilder.build()
        songSearchVC.navigationItem.title = "Songs via iTunes"

        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        navVC.viewControllers = [songSearchVC]
        navVC.title = "Songs"
        return navVC
    }
}
