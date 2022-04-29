//
//  SceneDelegate.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 12.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)

        let launchVC = LaunchViewController()
        let tabBarController = UITabBarController()
        let calcIcon = UIImage(systemName: "cross")
        let infoIcon = UIImage(systemName: "info")

        let calcVC = CalculateViewController()
        calcVC.tabBarItem = UITabBarItem(title: "Калькулятор", image: calcIcon, tag: 0)

        let infoVC = InfoViewController()
        infoVC.tabBarItem = UITabBarItem(title: "Информация", image: infoIcon, tag: 1)
        
        if #available(iOS 15, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        tabBarController.viewControllers = [calcVC,infoVC]
        
        window?.rootViewController = launchVC
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.window?.rootViewController = tabBarController
        }
        window?.makeKeyAndVisible()
    }

}

