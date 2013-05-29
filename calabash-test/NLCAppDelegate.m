//
//  NLCAppDelegate.m
//  calabash-test
//
//  Created by Grebenets, Maksym on 5/28/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import "NLCAppDelegate.h"
#import <ECSlidingViewController.h>
#import "ThirdyPartyHacks.h"
#import "NLCContentViewController.h"

@implementation NLCAppDelegate
@synthesize navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    ECSlidingViewController *slider = [[PatchedECSlidingViewController alloc] init];
	[slider setAnchorRightRevealAmount:274.0f];
	slider.anchorLeftPeekAmount = 20;
	slider.underLeftWidthLayout = ECFixedRevealWidth;
	slider.topViewController = navController;

    [navController.view addGestureRecognizer:navController.slidingViewController.panGesture];
    

    self.window.rootViewController = slider;
    self.window.accessibilityLabel = @"window";
    [self.window makeKeyAndVisible];

//    navController.view.accessibilityLabel = @"navViewController.view";
//    navController.navigationBar.accessibilityLabel = @"navigationBar";
//    navController.navigationItem.accessibilityLabel = @"navigationItem";

    
    NLCContentViewController *ctl = [[NLCContentViewController alloc] initWithNibName:@"NLCContentViewController" bundle:nil];
    
//    CATransition *transition;
//    transition = [CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromTop;
//    transition.duration = 0.3;
//    [self.navController.view.layer addAnimation:transition forKey:nil];
    
    [self.navController pushViewController:ctl animated:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
