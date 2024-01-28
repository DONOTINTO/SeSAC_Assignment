//
//  SceneDelegate.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/26/23.
//

import UIKit

enum TabImgae: Int {
    case home
    case newHot
    case stored
    
    var image: UIImage {
        switch self {
        case .home:
            UIImage(systemName: "house")!
        case .newHot:
            UIImage(systemName: "play.rectangle.on.rectangle")!
        case .stored:
            UIImage(systemName: "arrow.down.circle.fill")!
        }
    }
    
    var title: String {
        switch self {
        case .home:
            "홈"
        case .newHot:
            "new&hot"
        case .stored:
            "저장된 콘텐츠"
        }
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if #available(iOS 15, *) {
            // MARK: Navigation bar appearance
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            navigationBarAppearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            // MARK: Tab bar appearance
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor.black
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let rootVC = UITabBarController()
        let homeNaviVC = UINavigationController(rootViewController: HomeViewController())
        let newHotNaviVC = UINavigationController(rootViewController: NewHotViewController())
        let storedNaviVC = UINavigationController(rootViewController: StoredViewController())
        
        rootVC.setViewControllers([homeNaviVC, newHotNaviVC, storedNaviVC], animated: true)
        for idx in 0 ..< rootVC.tabBar.items!.count {
            let image = TabImgae(rawValue: idx)?.image
            let title = TabImgae(rawValue: idx)?.title
            rootVC.tabBar.items![idx].image = image
            rootVC.tabBar.items![idx].title = title
        }
        rootVC.tabBar.tintColor = .white
        // rootVC.tabBar.unselectedItemTintColor = .white
        
        self.window = window
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
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
    }


}

