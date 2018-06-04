//
//  AppDelegate.swift
//  SocialNetwork
//
//  Created by Tea Kupradze on 4/16/18.
//  Copyright © 2018 Tea Kupradze. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        parseSDKInit ()
        PFFacebookUtils.initializeFacebook(applicationLaunchOptions: launchOptions)
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
//        let isLogIn = UserDefaults.standard.object(forKey: "email")
//        if ((isLogIn) != nil){
//            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let homePage = mainStoryBoard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
//            let navigationController = UINavigationController(rootViewController: homePage)
//            navigationController.isNavigationBarHidden = true
//            window!.rootViewController = navigationController
//            window!.makeKeyAndVisible()
//        }
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        return handled
    }
    
//-(BOOL)application:(UIApplication *)application
//    openURL:(NSURL *)url
//    sourceApplication:(NSString *)sourceApplication
//    annotation:(id)annotation {
//
//    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
//    openURL:url
//    sourceApplication:sourceApplication
//    annotation:annotation
//    ];
//    // Add any custom logic here.
//    return handled;
//    }
//

 
    func logOutUser(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let logInPage = mainStoryBoard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        window!.rootViewController = logInPage
        window!.makeKeyAndVisible()
        
    }
    
    private func parseSDKInit () {
        let configuration = ParseClientConfiguration {
            $0.applicationId = "2u56E2tGkeEKZkNKC789eaBpVKrMM7mhmbPAoMTk"
            $0.clientKey = "hATve113Ke0ri96xw1FFbU8dmiPoMfMrAVIKTkmK"
            $0.server = "https://pg-app-8kd7bohhg60jeky1iwwcjqh8xa0i38.scalabl.cloud/1/"
        }
        Parse.initialize(with: configuration)
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

