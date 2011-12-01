//
//  MainView.h
//  Dec1
//
//  Created by Andrew Huey on 11/27/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface MainView : UIView {
    MainViewController *mainViewController;
    UISlider *slider_A, *slider_B, *slider_C;
    UIButton *btnRun;
}

-(void)initSlidersWithA: (int) a B: (int) b C: (int) c;
-(void)initBtnRun;
-(void)enableRunBtn;
- (id) initWithFrame: (CGRect) frame controller: (MainViewController *) c;

@end
