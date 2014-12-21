//
//  AppDelegate.swift
//  JobHunt
//
//  Created by takumi on 2014/12/20.
//  Copyright (c) 2014年 tm444. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        
        var pageController:UIPageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        
        var navigationController:SwipeBetweenViewControllers = SwipeBetweenViewControllers(rootViewController: pageController)
        
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        
        
        
        // Override point for customization after application launch.
        var demo:ViewController = storyboad.instantiateViewControllerWithIdentifier("ViewController") as ViewController
        demo.guidesiteId = "1928"
//        demo.type = ViewController.genreType.Nouhau
        
        var demo2:ViewController = storyboad.instantiateViewControllerWithIdentifier("ViewController") as ViewController
        demo2.guidesiteId = "1899"
//        demo2.type = ViewController.genreType.Girls
//        demo2.isForGirls = true
        
        var demo3:ViewController = storyboad.instantiateViewControllerWithIdentifier("ViewController") as ViewController
        demo3.guidesiteId = "1903"
//        demo3.type = ViewController.genreType.Fasshion
        var demo4:ViewController = storyboad.instantiateViewControllerWithIdentifier("ViewController") as ViewController
        demo4.guidesiteId = "1810"
//        demo4.type = ViewController.genreType.Kaihuku
        
        //        var demo5:UIViewController = UIViewController()
        demo.view.backgroundColor = UIColor.redColor()
        demo2.view.backgroundColor = UIColor.whiteColor()
        demo3.view.backgroundColor = UIColor.grayColor()
        demo4.view.backgroundColor = UIColor.orangeColor()
//        demo5.view.backgroundColor = UIColor.brownColor()
        
        navigationController.viewControllerArray = [demo,demo2,demo3,demo4]
        navigationController.buttonText = ["ノウハウ","キャリア","マナー","疲労回復"]
        //navigationController.navigationBar.barTintColor = [UIColor redColor]
        self.window?.rootViewController = navigationController
        //demo.navigationController?.navigationBar.barTintColor
        
        
         ASFSharedViewTransition.addTransitionWithFromViewControllerClass(ViewController.self, toViewControllerClass: DetailViewController.self, withNavigationController: self.window?.rootViewController as UINavigationController, withDuration: 0.2)
        
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}
