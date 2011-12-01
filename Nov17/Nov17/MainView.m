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

-(void)initSliders
{
    CGRect b = self.bounds;
    CGSize s = CGSizeMake(200, 16);        
    
    CGRect f = CGRectMake(b.size.width/2-100, 0, s.width,s.height);
    slider_A = [[UISlider alloc] initWithFrame: f];
    slider_A.minimumValue = 1;
    slider_A.maximumValue = 140;
    slider_A.value = A;
    slider_A.continuous = NO;
    [slider_A addTarget:self
                 action: @selector(sliderValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: slider_A];
    
    f = CGRectMake(b.size.width/2-100, 25, s.width,s.height);
    slider_B = [[UISlider alloc] initWithFrame: f];
    slider_B.minimumValue = 1;
    slider_B.maximumValue = 140;
    slider_B.value = B;
    slider_B.continuous = NO;
    [slider_B addTarget:self
                 action: @selector(sliderValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: slider_B];
    
    f = CGRectMake(b.size.width/2-100, 50, s.width,s.height);
    slider_C = [[UISlider alloc] initWithFrame: f];
    slider_C.minimumValue = 1;
    slider_C.maximumValue = 140;
    slider_C.value = C;
    slider_C.continuous = NO;
    [slider_C addTarget:self
                 action: @selector(sliderValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: slider_C];
}

-(void)initSteppers
{
    //CGRect b = self.bounds;
    CGSize s = CGSizeMake(80, 16);        
    
    CGRect f = CGRectMake(60, 0, s.width,s.height);
    stepper_A = [[UIStepper alloc] initWithFrame: f];
    stepper_A.minimumValue = 1;
    stepper_A.maximumValue = 140;
    stepper_A.value = A;
    stepper_A.continuous = NO;
    [stepper_A addTarget:self
                 action: @selector(stepperValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: stepper_A];
    
    f = CGRectMake(60, 25, s.width,s.height);
    stepper_B = [[UIStepper alloc] initWithFrame: f];
    stepper_B.minimumValue = 1;
    stepper_B.maximumValue = 140;
    stepper_B.value = B;
    stepper_B.continuous = NO;
    [stepper_B addTarget:self
                  action: @selector(stepperValueChanged:)
        forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: stepper_B];

    f = CGRectMake(60, 50, s.width,s.height);
    stepper_C = [[UIStepper alloc] initWithFrame: f];
    stepper_C.minimumValue = 1;
    stepper_C.maximumValue = 140;
    stepper_C.value = C;
    stepper_C.continuous = NO;
    [stepper_C addTarget:self
                  action: @selector(stepperValueChanged:)
        forControlEvents: UIControlEventValueChanged
     ];
    [self addSubview: stepper_C];
}

-(void)initBtn {
    btnToggleCtrls = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    CGRect b = self.bounds;
    CGSize s = CGSizeMake(180, 30);	//size of button
    
    btnToggleCtrls.frame = CGRectMake(
                                      (b.size.width - s.width) / 2,
                                      (b.size.height - s.height - 10),
                                      s.width,
                                      s.height
                                      );
    [btnToggleCtrls setTitle: @"Toggle Controls" forState: UIControlStateNormal];
    
    [btnToggleCtrls addTarget: self
                       action: @selector(btnToggleCtrlsClick:)
             forControlEvents: UIControlEventTouchUpInside
     ];        
    [self addSubview: btnToggleCtrls];
}

- (void)toggleCtrlVisibility {
    [slider_A setHidden:!showSliders];
    [slider_B setHidden:!showSliders];
    [slider_C setHidden:!showSliders];
    
    [stepper_A setHidden:showSliders];
    [stepper_B setHidden:showSliders];
    [stepper_C setHidden:showSliders];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        showSliders = YES;
        A = 80;
        B = 14;
        C = 30;
        
        [self initBtn];
        [self initSliders];
        [self initSteppers];
        [self toggleCtrlVisibility];
    }
    return self;
}

- (void) btnToggleCtrlsClick: (id) sender {
    showSliders = !showSliders;
    [self toggleCtrlVisibility];
}

- (void) sliderValueChanged: (id) sender {
	UISlider *s = sender;
    if (s == slider_A) {
        A = s.value;
        stepper_A.value = A;
    } else if (s == slider_B) {
        B = s.value;
        stepper_B.value = B;
    } else if (s == slider_C) {
        C = s.value;
        stepper_C.value = C;
    }  
    [self setNeedsDisplay];
}

- (void) stepperValueChanged: (id) sender {
	UIStepper *s = sender;
    if (s == stepper_A) {
        A = s.value;
        slider_A.value = A;
    } else if (s == stepper_B) {
        B = s.value;
        slider_B.value = B;
    } else if (s == stepper_C) {
        C = s.value;
        slider_C.value = C;
    }  
    [self setNeedsDisplay];
}

-(void)drawValues
{
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
}

- (void)drawRect:(CGRect)rect
{
    // ref: http://blog.csharphelper.com/2010/01/18/draw-a-hypotrochoid-spirograph-curve-in-c.aspx
    
    [self drawValues];
    
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
    NSLog(@"max_t = %f", max_t);
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
