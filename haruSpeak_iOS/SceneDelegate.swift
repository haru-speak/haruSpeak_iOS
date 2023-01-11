//
//  SceneDelegate.swift
//  haruSpeak_iOS
//
//  Created by 077tech on 2023/01/11.
//

import UIKit
import Then

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let homeVC = UINavigationController(rootViewController:HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.title = "홈"
        
        let studyVC =  UINavigationController(rootViewController:StudyViewController())
        studyVC.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        studyVC.title = "스터디"
        
        let myPageVC = UINavigationController(rootViewController:MyPageViewController())
        myPageVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        myPageVC.title = "마이페이지"
        
        let tabbar = UITabBarController().then {
            $0.tabBar.backgroundColor = .white
            $0.viewControllers = [homeVC, studyVC, myPageVC]
            $0.tabBar.tintColor = .mainColor
            $0.tabBar.unselectedItemTintColor = .darkGray
            $0.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
            $0.tabBar.layer.shadowOpacity = 1.0
            $0.tabBar.layer.shadowOffset = .zero
            $0.tabBar.clipsToBounds = false
        }
        
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

