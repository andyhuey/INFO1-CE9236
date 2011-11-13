//
//  MyAppDelegate.h
//  Nov17
//
//  Created by Andrew Huey on 11/13/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface MyAppDelegate : UIResponder <UIApplicationDelegate> {
    MainView *mainView;
}

@property (strong, nonatomic) UIWindow *window;

@end
