//
//  SceneDelegate.swift
//  SeSAC_Assignment_0131
//
//  Created by 이중엽 on 1/31/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if #available(iOS 15, *) {
            // MARK: Navigation bar appearance
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.black
            ]
            navigationBarAppearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            // MARK: Tab bar appearance
            // let tabBarAppearance = UITabBarAppearance()
            // tabBarAppearance.configureWithOpaqueBackground()
            // tabBarAppearance.backgroundColor = UIColor.black
            // UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            // UITabBar.appearance().standardAppearance = tabBarAppearance
        }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let rootVC = TryViewController()
        let naviVC = UINavigationController(rootViewController: rootVC)
        
        self.window = window
        self.window?.rootViewController = naviVC
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







// func callAPI<T: Decodable>(api: TMDBAPI, type: T.Type, completion: @escaping (T) -> Void) {
//     AF.request(api.endPoint,
//                method: api.method,
//                parameters: api.parameters,
//                encoding: URLEncoding(destination: .queryString),
//                headers: api.header).responseDecodable(of: type.self) { response in
//         switch response.result {
//         case .success(let success):
//             completion(success)
//         case .failure(let failure):
//             print(failure)
//         }
//     }
// }
// 
// 
// 
// func fetch() {
//     let view = getMainView()
//     
//     let dispatchGroup = DispatchGroup()
//     
//     for idx in 0 ..< TMDBAPI.count {
//         guard let api = TMDBAPI(rawValue: idx) else { return }
//         
//         switch api {
//         case .details:
//             dispatchGroup.enter()
//             APIManager.shared.callAPI(api: api, type: TVDetailsModel.self) { data in
//                 let urlStr = Consts.Image.baseImagURL + data.backdropPath
//                 let url = URL(string: urlStr)
//                 
//                 view.contentImageView.kf.setImage(with: url)
//                 view.titleLabel.text = data.name
//                 view.rateLabel.text = "\(data.voteAverage)점"
//                 view.episodeLabel.text = "에피소드 \(data.numberOfEpisodes)개"
//                 view.overviewLabel.text = data.overview
//                 dispatchGroup.leave()
//             }
//         case .casting:
//             dispatchGroup.enter()
//             APIManager.shared.callAPI(api: api, type: TVCastingModel.self) { data in
//                 var max = 0
//                 
//                 data.cast.forEach {
//                     if $0.totalEpisodeCount > max { max = $0.totalEpisodeCount }
//                 }
//                 
//                 let mainCastingList = data.cast.filter { $0.totalEpisodeCount == max }
//                 
//                 self.castingList = mainCastingList
//                 dispatchGroup.leave()
//             }
//         case .recommend:
//             dispatchGroup.enter()
//             APIManager.shared.callAPI(api: api, type: TVRecommendModel.self) { data in
//                 self.recommendList = data.results
//                 dispatchGroup.leave()
//             }
//         }
//     }
//     
//     dispatchGroup.notify(queue: .main) {
//         self.getMainView().actorCollectionView.reloadData()
//         self.getMainView().recommendCollectionView.reloadData()
//     }
// }
