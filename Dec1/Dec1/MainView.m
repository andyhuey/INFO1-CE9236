//
//  MainView.m
//  Dec1
//
//  Created by Andrew Huey on 11/27/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "MainView.h"
#import "MainViewController.h"

@implementation MainView

-(void)initSlidersWithA: (int) a B: (int) b C: (int) c 
{
    CGRect bnds = self.bounds;
    CGSize s = CGSizeMake(200, 16);        
    
    CGRect f = CGRectMake(bnds.size.width/2-100, 320, s.width,s.height);
    slider_A = [[UISlider alloc] initWithFrame: f];
    slider_A.minimumValue = 1;
    slider_A.maximumValue = 140;
    slider_A.value = a;
    slider_A.continuous = NO;
    [slider_A addTarget:self
                 action: @selector(sliderValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: slider_A];
    
    f = CGRectMake(bnds.size.width/2-100, 345, s.width,s.height);
    slider_B = [[UISlider alloc] initWithFrame: f];
    slider_B.minimumValue = 1;
    slider_B.maximumValue = 140;
    slider_B.value = b;
    slider_B.continuous = NO;
    [slider_B addTarget:self
                 action: @selector(sliderValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: slider_B];
    
    f = CGRectMake(bnds.size.width/2-100, 370, s.width,s.height);
    slider_C = [[UISlider alloc] initWithFrame: f];
    slider_C.minimumValue = 1;
    slider_C.maximumValue = 140;
    slider_C.value = c;
    slider_C.continuous = NO;
    [slider_C addTarget:self
                 action: @selector(sliderValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: slider_C];
}

- (void) sliderValueChanged: (id) sender {
	UISlider *s = sender;
    if (s == slider_A) {
        mainViewController.A = s.value;
    } else if (s == slider_B) {
        mainViewController.B = s.value;
    } else if (s == slider_C) {
        mainViewController.C = s.value;
    }  
    //[self setNeedsDisplay];
}

- (void) btnRunClick: (id) sender {
    NSLog(@"in btnRunClick");
    if (mainViewController.isAnimRunning) {
        [mainViewController stopAnimation];
        [btnRun setTitle:@"Start" forState:UIControlStateNormal];    
    } 
    else {
        [mainViewController startAnimation];
        [btnRun setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

-(void) enableRunBtn {
    //[btnRun setEnabled:YES];
    [btnRun setTitle:@"Start" forState:UIControlStateNormal];
}

-(void)initBtnRun {
    btnRun = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    CGRect b = self.bounds;
    CGSize s = CGSizeMake(180, 30);	//size of button
    
    btnRun.frame = CGRectMake(
                              (b.size.width - s.width) / 2,
                              (b.size.height - s.height - 10),
                              s.width,
                              s.height
                              );
    [btnRun setTitle: @"Start" forState: UIControlStateNormal];
    
    [btnRun addTarget: self
               action: @selector(btnRunClick:)
     forControlEvents: UIControlEventTouchUpInside
     ];        
    [self addSubview: btnRun];
}

- (id)initWithFrame:(CGRect)frame
         controller: (MainViewController *) c
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.backgroundColor = [UIColor whiteColor];
        //[self initBtnRun];
        mainViewController = c;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
