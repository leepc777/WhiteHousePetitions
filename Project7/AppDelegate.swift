//
//  AppDelegate.swift
//  Project7
//
//  Created by Patrick on 2/9/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //MARK: insert 2nd VC to topRated Tab
        if let tabBarController = window?.rootViewController as? UITabBarController {
            
            // set refernce to current storyBoard
            let storyBoard = UIStoryboard(name: "Main", bundle:nil)
            
            // creat a new instance of current NavibationController "NAVController"
            // NAVcontroller already embeded with a TableViewController
            let vc1 = storyBoard.instantiateViewController(withIdentifier: "NavController")
            
            //new tab at tag 1. a tobRated icon, tag 0 has been built in StoryBoard UI as Most Resent
            vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag:1)
            //add the new navigation VC to tabBarcontroller
            tabBarController.viewControllers?.append(vc1)
            
            let vc2 = storyBoard.instantiateViewController(withIdentifier: "NavController")

            vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
            tabBarController.viewControllers?.append(vc2)

            
        }
        
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
    }


}

