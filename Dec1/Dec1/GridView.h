//
//  GridView.h
//  Dec1
//
//  Created by Andrew Huey on 11/27/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class MainViewController;

@interface GridView : UIView {
    MainViewController *mainViewCtrl;
    //int A, B, C;
    double curr_t;
    double max_t;
}

-(id) initWithFrame: (CGRect) frame controller: (MainViewController *) c; 
-(void) initSpiro;
-(void) move: (CADisplayLink *) displayLink;

@end
