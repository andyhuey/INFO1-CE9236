//
//  MyAppDelegate.m
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "MyAppDelegate.h"
#import "ComicViewController.h"
#import "IssueInfo.h"

@implementation MyAppDelegate

@synthesize window = _window;

-(void)initIssues {
    self->issues[0] = [NSArray arrayWithObjects:
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:1],
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:2],
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:3],
        nil
        ];
    
    self->issues[1] = [NSArray arrayWithObjects:
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:1],
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:2],
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:3],
        nil
        ];
    
    self->issues[2] = [NSArray arrayWithObjects:
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:1],
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:2],
        [[IssueInfo alloc] initWithImg:@"todo" issueNo:3],
        nil
        ];
}

-(void)initControllers {
    self->cvc[0] = [[ComicViewController alloc] 
         initWithTitle:@"Crime"
         fullTitle:@"Crime SuspenStories" 
         tabImage:@"21-skull.png"
         issueInfo: [issues[0] objectAtIndex:0]];
    
    self->cvc[1] = [[ComicViewController alloc] 
         initWithTitle:@"More Fun"
         fullTitle:@"More Fun Comics" 
         tabImage:@"114-balloon.png"
         issueInfo: [issues[1] objectAtIndex:0]];
    
    self->cvc[2] = [[ComicViewController alloc] 
         initWithTitle:@"Whiz"
         fullTitle:@"Whiz Comics" 
         tabImage:@"64-zap.png"
         issueInfo: [issues[2] objectAtIndex:0]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [self initIssues];
    [self initControllers];
    
    visited[0] = [NSMutableArray arrayWithObject: cvc[0]];
    visited[1] = [NSMutableArray arrayWithObject: cvc[1]];
    visited[2] = [NSMutableArray arrayWithObject: cvc[2]];
    
    UITabBarController *tbc = [[UITabBarController alloc] init];
    self.window.rootViewController = tbc;
    tbc.viewControllers = [NSArray arrayWithObjects: 
        [[UINavigationController alloc] initWithRootViewController:cvc[0]], 
        [[UINavigationController alloc] initWithRootViewController:cvc[1]], 
        [[UINavigationController alloc] initWithRootViewController:cvc[2]], 
        nil];
    
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) nextIssue:(NSString *)title {
    int currTab;
    if ([title isEqualToString:@"Crime"])
        currTab = 0;
    else if ([title isEqualToString:@"More Fun"])
        currTab = 1;
    else if ([title isEqualToString:@"Whiz"])
        currTab = 2;
    else
        return;
    NSLog(@"currTab = %d", currTab);
    
    NSArray *currIssues = issues[currTab];
    NSMutableArray *currVisited = visited[currTab];
    
    UITabBarController *tbc = (UITabBarController *)self.window.rootViewController;
	UINavigationController *nav = (UINavigationController *)tbc.selectedViewController;
    
	int i = nav.viewControllers.count;
	if (i == currIssues.count) {
		//We are currently on the last issue.
		return;
	}
    NSLog(@"i = %d", i);
    
    ComicViewController* currCvc = [currVisited objectAtIndex: i-1];
    
	if (currVisited.count <= i) {
		//This station is being visited for the first time.
		[currVisited addObject:
         [[ComicViewController alloc] initWithTitle:currCvc.tabBarItem.title 
                                          fullTitle:currCvc.fullTitle 
                                           tabImage:currCvc.tabImageName 
                                          issueInfo:[currIssues objectAtIndex:i]]
         ];
	}
	
	[nav pushViewController: [currVisited objectAtIndex: i] animated: YES];
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
