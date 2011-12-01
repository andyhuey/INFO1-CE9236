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

- (void) btnRunClick: (id) sender {
    NSLog(@"in btnRunClick");
    [mainViewController startAnimation];
    [btnRun setEnabled:NO];
}

-(void) enableRunBtn {
    [btnRun setEnabled:YES];
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
