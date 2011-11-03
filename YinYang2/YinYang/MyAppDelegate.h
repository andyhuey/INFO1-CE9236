//
//  MyAppDelegate.h
//  YinYang
//
//  Created by Andrew Huey on 10/24/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
@class View;

@interface MyAppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
	UIWindow *window;
    AVAudioPlayer *player;
}

//@property (strong, nonatomic) UIWindow *window;

@end
