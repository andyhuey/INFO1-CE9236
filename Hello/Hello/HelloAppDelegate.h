//
//  HelloAppDelegate.h
//  Hello
//
//  Created by Andrew Huey on 10/17/11.
//  Copyright 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface HelloAppDelegate : NSObject <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@end
