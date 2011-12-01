//
//  MainViewController.h
//  Dec1
//
//  Created by Andrew Huey on 11/27/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class MainView;
@class GridView;

@interface MainViewController : UIViewController {
    MainView *myMainView;
    GridView *myGridView;
    CADisplayLink *displayLink;
    int A, B, C;
    BOOL isAnimRunning;
}

@property int A, B, C;
@property BOOL isAnimRunning;

-(void)startAnimation;
-(void)stopAnimation;

@end
