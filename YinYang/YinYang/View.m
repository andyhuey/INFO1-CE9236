//
//  View.m
//  YinYang
//
//  Created by Andrew Huey on 10/24/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"in initWithFrame");
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        //self.backgroundColor = [UIColor purpleColor];
        //Keep the size of the view the same,
		//but let the center of the view be the origin.
		CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect b = self.bounds;
    CGFloat r = .45 * b.size.width;	//radius, in pixels
    
    CGRect rect1 = CGRectMake(
                          -r,
                          -r,
                          2 * r,
                          2 * r
                          );
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    CGContextAddEllipseInRect(c, rect1);
    CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);
    CGContextStrokePath(c);
    
    // fill in the right half - black
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 0, r);
    CGContextAddLineToPoint(c, 0, -r);
    CGContextAddArcToPoint(c, r, -r, r, 0, r);
    CGContextAddArcToPoint(c, r, r, 0, r, r);
    CGContextClosePath(c);                  //back to starting point
    //CGContextSetRGBStrokeColor(c, 0, 0, 0, 1);
    //CGContextStrokePath(c);
	CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
    
    // draw a smaller white circle @ the top
    CGFloat r2 = r / 2;   
    CGRect rect2 = CGRectMake(-r2, -r, r, r);
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, rect2);
    CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);	// white, opaque
    CGContextFillPath(c);
    
    // smaller black circle @ bottom
    CGRect rect3 = CGRectMake(-r2, 0, r, r);
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, rect3);
    CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 1.0);	// black, opaque
    CGContextFillPath(c);
    
    // tiny black circle @ top
    CGFloat rTiny = r2 / 4;
    CGRect rect4 = CGRectMake(-rTiny, -r2 - rTiny/2, rTiny*2, rTiny*2);
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, rect4);
    CGContextSetRGBFillColor(c, 0, 0, 0, 1);
    CGContextFillPath(c);
    
    // tiny white circle @ bottom
    CGRect rect5 = CGRectMake(-rTiny, r2 - rTiny/2, rTiny*2, rTiny*2);
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, rect5);
    CGContextSetRGBFillColor(c, 1, 1, 1, 1);
    CGContextFillPath(c);
    
}


@end
