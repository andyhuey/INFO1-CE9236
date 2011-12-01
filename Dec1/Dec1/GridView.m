//
//  GridView.m
//  Dec1
//
//  Created by Andrew Huey on 11/27/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "GridView.h"
#import "MainViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation GridView

double X(double t, double A, double B, double H);
double Y(double t, double A, double B, double C);
long GCD(long a, long b);
long LCM(long a, long b);

- (id)initWithFrame:(CGRect)frame controller: (MainViewController *) c
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = UIColorFromRGB(0xfffacd);
        //[UIColor yellowColor];
        mainViewCtrl = c;        
        //A = 80;
        //B = 14;
        //C = 30;

    }
    return self;
}

-(void) initSpiro {
    curr_t = 0;
}

- (void) move: (CADisplayLink *) displayLink {
	//NSLog(@"%.15g", displayLink.timestamp);	//15 significant digits
	curr_t++;
    [self setNeedsDisplay];
    if (curr_t > max_t) {
        // stop it
        [mainViewCtrl stopAnimation];
        //[self initSpiro];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    NSLog(@"w=%f, h=%f", w, h);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(c, 255, 0, 255, 1); // purple.
    CGContextSetLineWidth(c, 1.0);
    CGContextBeginPath(c);
    
    int iter = 100;
    
    int cx = w / 2;
    int cy = (h / 2); // + 25;
    double t = 0;
    double dt = M_PI / iter;
    /*double*/ max_t = 2 * M_PI * mainViewCtrl.B / GCD(mainViewCtrl.A, mainViewCtrl.B);
    NSLog(@"max_t = %f", max_t);
    double x1 = cx + X(t, mainViewCtrl.A, mainViewCtrl.B, mainViewCtrl.C);
    double y1 = cy + Y(t, mainViewCtrl.A, mainViewCtrl.B, mainViewCtrl.C);
    CGContextMoveToPoint(c, x1, y1);
    while (t <= max_t && t <= curr_t)
    {
        t += dt;
        x1 = cx + X(t, mainViewCtrl.A, mainViewCtrl.B, mainViewCtrl.C);
        y1 = cy + Y(t, mainViewCtrl.A, mainViewCtrl.B, mainViewCtrl.C);
        CGContextAddLineToPoint(c, x1, y1);
    }
    CGContextStrokePath(c);
    
}

// The parametric function X(t).
double X(double t, double A, double B, double H)
{
    return (A - B) * cos(t) + H * cos((A - B) / B * t);
}

// The parametric function Y(t).
double Y(double t, double A, double B, double C)
{
    return (A - B) * sin(t) - C * sin((A - B) / B * t);
}

// Use Euclid's algorithm to calculate the
// greatest common divisor (GCD) of two numbers.
long GCD(long a, long b)
{
    // Make a >= b.
    a = abs(a);
    b = abs(b);
    if (a < b)
    {
        long tmp = a;
        a = b;
        b = tmp;
    }
    
    // Pull out remainders.
    for (;;)
    {
        long remainder = a % b;
        if (remainder == 0) return b;
        a = b;
        b = remainder;
    }
}

// Return the least common multiple
// (LCM) of two numbers.
long LCM(long a, long b)
{
    return a * b / GCD(a, b);
}

@end
