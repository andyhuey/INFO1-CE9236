//
//  View.m
//  YinYang
//
//  Created by Andrew Huey on 10/24/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "View.h"
#import "MySubView.h"

@implementation View

@synthesize player;

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"in initWithFrame");
        // Initialization code
        angle = 0;
        firstTime = true;
        self.backgroundColor = [UIColor whiteColor];
        //self.backgroundColor = [UIColor purpleColor];
        //Keep the size of the view the same,
		//but let the center of the view be the origin.
		CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
        
        // let's start by making the subview fill the view...
        CGRect f = CGRectMake(-w/2, -h/2, w, h);
        mySubView = [[MySubView alloc] initWithFrame: f];
		[self addSubview: mySubView];
    }
    return self;
}

-(void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        if (firstTime) {
            [mySubView setNeedsDisplay];
            firstTime = false;
        }
        
        angle += 90;
        if (angle >= 360) angle = 0;
        
        [UIView animateWithDuration: 1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             //This block describes what the animation should do.
                             mySubView.center = [[touches anyObject] locationInView: self];
                             //littleView.alpha = 0.0;	//0.0 is transparent, 1.0 is opaque
                             //littleView.backgroundColor = [UIColor greenColor];
                             CGAffineTransform s = CGAffineTransformMakeScale(0.5,0.5);
                             CGAffineTransform r = CGAffineTransformMakeRotation(angle * M_PI / 180);
                             CGAffineTransform c = CGAffineTransformConcat(r, s);
                             mySubView.transform = c;
                         }
                         completion:^(BOOL finished) { [player play]; }
         ];
        
	}
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}


@end
