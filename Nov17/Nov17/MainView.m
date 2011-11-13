//
//  MainView.m
//  Nov17
//
//  Created by Andrew Huey on 11/13/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "MainView.h"

@implementation MainView

double X(double t, double A, double B, double H);
double Y(double t, double A, double B, double C);
long GCD(long a, long b);
long LCM(long a, long b);

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        A = 80;
        B = 14;
        C = 30;

        CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 16);        

		CGRect f = CGRectMake(b.size.width/2-100, 0, s.width,s.height);
		slider_A = [[UISlider alloc] initWithFrame: f];
		slider_A.minimumValue = 1;
		slider_A.maximumValue = 140;
		slider_A.value = A;
        [slider_A addTarget:self
                   action: @selector(valueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
        [self addSubview: slider_A];

        f = CGRectMake(b.size.width/2-100, 25, s.width,s.height);
		slider_B = [[UISlider alloc] initWithFrame: f];
		slider_B.minimumValue = 1;
		slider_B.maximumValue = 140;
		slider_B.value = B;
        [slider_B addTarget:self
                     action: @selector(valueChanged:)
           forControlEvents: UIControlEventValueChanged
         ];
        [self addSubview: slider_B];
    
        f = CGRectMake(b.size.width/2-100, 50, s.width,s.height);
		slider_C = [[UISlider alloc] initWithFrame: f];
		slider_C.minimumValue = 1;
		slider_C.maximumValue = 140;
		slider_C.value = C;
        [slider_C addTarget:self
                     action: @selector(valueChanged:)
           forControlEvents: UIControlEventValueChanged
         ];
        [self addSubview: slider_C];
    }
    return self;
}

- (void) valueChanged: (id) sender {
	UISlider *s = sender;
    if (s == slider_A) {
        A = s.value;
    } else if (s == slider_B) {
        B = s.value;
    } else if (s == slider_C) {
        C = s.value;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // ref: http://blog.csharphelper.com/2010/01/18/draw-a-hypotrochoid-spirograph-curve-in-c.aspx
    
    UIFont *font = [UIFont systemFontOfSize: 20.0];
    NSString *s = [NSString stringWithFormat:@"A=%d", A];
    CGPoint point = CGPointMake(0, 0);
    [s drawAtPoint: point withFont: font];
    
    s = [NSString stringWithFormat:@"B=%d", B];
    point = CGPointMake(0, 25);
    [s drawAtPoint: point withFont: font];

    s = [NSString stringWithFormat:@"C=%d", C];
    point = CGPointMake(0, 50);
    [s drawAtPoint: point withFont: font];

    // Drawing code
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    NSLog(@"width = %f", w);      // 320
    NSLog(@"height = %f", h);    // 460
    
    int iter = 100;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(c, 255, 0, 255, 1); // purple.
    CGContextSetLineWidth(c, 1.0);
    CGContextBeginPath(c);
    
    int cx = w / 2;
    int cy = (h / 2) + 25;
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
