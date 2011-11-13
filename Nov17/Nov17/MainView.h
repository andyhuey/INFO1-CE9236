//
//  MainView.h
//  Nov17
//
//  Created by Andrew Huey on 11/13/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView {
    int A, B, C;
    BOOL showSliders;
    UIButton *btnToggleCtrls;
    UISlider *slider_A, *slider_B, *slider_C;
    UIStepper *stepper_A, *stepper_B, *stepper_C;
}

@end
