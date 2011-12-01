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
    UIButton *btnRun;
}

-(void)initBtnRun;
-(void)enableRunBtn;
- (id) initWithFrame: (CGRect) frame controller: (MainViewController *) c;

@end
