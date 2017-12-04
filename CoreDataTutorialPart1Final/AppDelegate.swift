//
//  AppDelegate.swift
//  CoreDataTutorialPart1Final
//
//  Created by James Rochabrun on 3/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var tabBarController: UITabBarController!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let photoVC = PhotoVC()
        let profileVC = ProfileViewController()
        let loginVC = LoginViewController()
        let commentsVC = CommentsViewController()
        
        CoreDataStack.sharedInstance.applicationDocumentsDirectory()
        
        self.tabBarController = UITabBarController()
        self.tabBarController.viewControllers = [
            UINavigationController(rootViewController: photoVC),
            commentsVC,
            loginVC
        ]
        //UINavigationController(rootViewController: profileVC)
        
        let item1 = UITabBarItem(title: "Photos", image: nil, tag: 0)
        let item2 = UITabBarItem(title: "Search", image: nil, tag: 1)
        let item3 = UITabBarItem(title: "Add", image: nil, tag: 2)
        let item4 = UITabBarItem(title: "Login", image: nil, tag: 3)
        let item5 = UITabBarItem(title: "Profile", image: nil, tag: 4)
        
        self.tabBarController.tabBarItem = item1
        self.tabBarController.tabBarItem = item2
        self.tabBarController.tabBarItem = item3
        self.tabBarController.tabBarItem = item4
        self.tabBarController.tabBarItem = item5
        
        window?.rootViewController = self.tabBarController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataStack.sharedInstance.saveContext()
    }




}

