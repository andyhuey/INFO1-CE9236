//
//  MyAppDelegate.m
//  YinYang
//
//  Created by Andrew Huey on 10/24/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "MyAppDelegate.h"
#import "View.h"

@implementation MyAppDelegate

//@synthesize window = _window;

-(BOOL) setupAudioPlayer
{
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle");
        return NO;
    }
    
    //The path is the filename.
    NSString *path =
    [bundle pathForResource: @"sound46" ofType: @"mp3"];
    if (path == nil) {
        NSLog(@"could not get the path");
        return NO;
    }
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];
    if (player == nil) {
        NSLog(@"error == %@", error);
        return NO;
    }
    
    player.volume = 1.0;		//the default
    player.numberOfLoops = 0;	//negative number for infinite loop
    /*
     NSLog(@"player.numberOfChannels == %u",
     player.numberOfChannels); //mono or stereo
     */
    
    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return NO;
    }
    
//    if (![player play]) {
//        NSLog(@"could not play");
//        return NO;
//    }
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"in didFinishLaunchingWithOptions");
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    UIScreen *screen = [UIScreen mainScreen];
    view = [[View alloc] initWithFrame: screen.applicationFrame];
    window = [[UIWindow alloc] initWithFrame: screen.bounds];    
    //self.window.backgroundColor = [UIColor purpleColor];
    [window addSubview: view];
    
    [window makeKeyAndVisible];
    
    if (![self setupAudioPlayer]) {
        return NO; 
    }
    view.player = player;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
