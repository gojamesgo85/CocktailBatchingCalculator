//
//  SceneDelegate.swift
//  BigBatch
//
//  Created by James on 11/22/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

   
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let rootScreen = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: rootScreen.coordinateSpace.bounds)
        window?.windowScene = rootScreen
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
  
    func createCocktailSpecsVC() -> UINavigationController {
        let homeScreen =  CocktailSpecsVC()
        homeScreen.title = "Cocktail Specs"
        homeScreen.tabBarItem = UITabBarItem(title: "Cocktail Specs", image: UIImage(systemName: SFSymbols.jigger), tag: 0)
        
        return UINavigationController(rootViewController: homeScreen)
    }
    func createSavedBatchesVC() -> UINavigationController {
        let batchVC = SavedBatches(persistantStorage: StorageProvider.sharedStorageProvider)
        batchVC.title = "Your Saved Cocktails"
        batchVC.tabBarItem = UITabBarItem(title: "Saved Cocktails", image: UIImage(systemName: SFSymbols.star), tag: 1)
        return UINavigationController(rootViewController: batchVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
        UITabBar.appearance().backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.0)
        UITabBar.appearance().unselectedItemTintColor = .systemGray4
        tabbar.viewControllers = [createCocktailSpecsVC(), createSavedBatchesVC()]
        return tabbar
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

