//
//  HelloAppDelegate.m
//  Hello
//
//  Created by Andrew Huey on 10/17/11.
//  Copyright 2011 EVI. All rights reserved.
//

#import "HelloAppDelegate.h"
#import "View.h"

@implementation HelloAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[UIApplication sharedApplication].statusBarHidden = YES;
    
    UIScreen *s = [UIScreen mainScreen];
    CGRect b = s.bounds;
    printRectInfo(@"application:didFinishLaunchingWithOptions: b=", b);
    CGRect f = s.applicationFrame;
    printRectInfo(@"application:didFinishLaunchingWithOptions: f=", f);
    
    //view = [[View alloc] initWithFrame: f];
    view = [[View alloc]
            initWithFrame: f
            string: @"HelloWorld!"
            backgroundColor: [UIColor whiteColor]
            point: CGPointMake(0.0, 0.0)
            font:  [UIFont systemFontOfSize: 32.0]
            ];
    
    // should be 1
    NSLog(@"application:didFinishLaunchingWithOptions: view.retainCount == %u",
		  view.retainCount);
    _window = [[UIWindow alloc] initWithFrame: b];
    
    [_window addSubview: view];
    // should be 2
    NSLog(@"application:didFinishLaunchingWithOptions: view.retainCount == %u",
		  view.retainCount);
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive:");
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground:");
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground:");
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"applicationDidBecomeActive:");
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"applicationWillTerminate:");
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [view release];
    [super dealloc];
}

@end
