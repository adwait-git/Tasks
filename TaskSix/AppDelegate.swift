//
//  AppDelegate.swift
//  TaskSix
//
//  Created by AllSpark on 02/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController : KYDrawerController?
    var slideOutMenuViewController : SlideOutMenuViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        Util.copyFile(fileName: "FMDBDatabase.sqlite")
        drawerController = getDrawerViewControler()
        window?.rootViewController = drawerController
        window?.makeKeyAndVisible()

        // Override point for customization after application launch.
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

    private func getDrawerViewControler() -> KYDrawerController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        slideOutMenuViewController = storyboard.instantiateViewController(withIdentifier: "SlideOutMenuViewController") as? SlideOutMenuViewController
        let drawerController = KYDrawerController(drawerDirection: .left, drawerWidth: UIScreen.main.bounds.width - 100)
        drawerController.mainViewController = slideOutMenuViewController!.logInNavController
        drawerController.drawerViewController = slideOutMenuViewController
        return drawerController
    }
    func drawerStatus(isOpen: Bool, animated: Bool)  {
        if isOpen {
            drawerController?.setDrawerState(.opened, animated: true)
        }
        else {
            drawerController?.setDrawerState(.closed, animated: true)
        }
    }

}

