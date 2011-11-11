//
//  SpiroView.m
//  Nov10
//
//  Created by Andrew Huey on 11/7/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "SpiroView.h"

@implementation SpiroView

double X(double t, double A, double B, double H);
double Y(double t, double A, double B, double C);
long GCD(long a, long b);
long LCM(long a, long b);

- (id)initWithFrame:(CGRect)frame 
            bgColor:(UIColor*)bgColor 
                  A:(int)a B:(int)b C:(int)c
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = bgColor;
        A = a;
        B = b;
        C = c;
        needsInstructions = NO;
        
        //CGFloat w = self.bounds.size.width;
		//CGFloat h = self.bounds.size.height;
		//self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    }
    return self;
}

-(void)tweakB: (int)bdiff {
    if (B + bdiff > 0) {
        B += bdiff;
    }
    [self setNeedsDisplay];
}

-(void) setNeedsInstructions: (BOOL)b {
    needsInstructions = b;
    [self setNeedsDisplay];
}

-(void) drawInstructions:(CGRect)rect
{
    UIFont *font = [UIFont systemFontOfSize: 18.0];
    NSString *s = @"Swipe left & right to switch views.";
    [s drawAtPoint:CGPointMake(0,0) withFont:font];
    s = @"Swipe up and down to change B value.";
    [s drawAtPoint:CGPointMake(0,20) withFont:font];
    s = @"Single-tap to start.";
    [s drawAtPoint:CGPointMake(0,40) withFont:font];
    needsInstructions = NO;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{    
    if (needsInstructions) {
        [self drawInstructions:rect];
        return;
    }
    // ref: http://blog.csharphelper.com/2010/01/18/draw-a-hypotrochoid-spirograph-curve-in-c.aspx
    
    UIFont *font = [UIFont systemFontOfSize: 20.0];
    NSString *s = [NSString stringWithFormat:@"A=%d B=%d C=%d", A, B, C];
    CGPoint point = CGPointMake(0, 0);
    [s drawAtPoint: point withFont: font]; 
    
    // Drawing code
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    NSLog(@"width = %f", w);      // 320
    NSLog(@"height = %f", h);    // 460
    
    //A = 80;
    //B = 14;
    //C = 30;
    int iter = 100;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(c, 255, 0, 255, 1); // purple?
    CGContextSetLineWidth(c, 1.0);
    CGContextBeginPath(c);
    
    int cx = w / 2;
    int cy = h / 2;
    double t = 0;
    double dt = M_PI / iter;
    double max_t = 2 * M_PI * B / GCD(A, B);
    double x1 = cx + X(t, A, B, C);
    double y1 = cy + Y(t, A, B, C);
    CGContextMoveToPoint(c, x1, y1);
    while (t <= max_t)
    {
        t += dt;
        x1 = cx + X(t, A, B, C);
        y1 = cy + Y(t, A, B, C);
        CGContextAddLineToPoint(c, x1, y1);
    }
    CGContextStrokePath(c);
    //CGContextClosePath(c);
    NSLog(@"done with drawRect");
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
