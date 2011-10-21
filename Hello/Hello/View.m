//
//  View.m
//  Hello
//
//  Created by Andrew Huey on 10/17/11.
//  Copyright 2011 EVI. All rights reserved.
//

#import "View.h"

/*
 Bits 16 to 23 inclusive of the color represent the amount of red in the color.
 Change these bits to a fraction in the range 0 to 1 inclusive.
 Similarly, bits 8 to 15 inclusive represent the amount of green;
 bits 0 to 7 inclusive represent the amount of blue.
 */
#define RED(color)	(((color) >> 2*8 & 0xFF) / 255.0)
#define GREEN(color)	(((color) >> 1*8 & 0xFF) / 255.0)
#define BLUE(color)	(((color) >> 0*8 & 0xFF) / 255.0)

@implementation View

@synthesize string;
@synthesize point;
@synthesize font;

/*
 - (id)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame: self.retainCount == %u", self.retainCount);
    printRectInfo(@"View: initWithFrame: frame=", frame);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
		string = @"Hello, World!";
		point = CGPointMake(0, 0);
		font = [UIFont systemFontOfSize: 32];
        
        //self.backgroundColor = [UIColor yellowColor];
        //self.backgroundColor = [UIColor colorWithRed: 1.0 green: 0.4 blue: 0.2 alpha: 1.0];
        
        //unsigned color = 0xFF00FF;	//purple
        //self.backgroundColor = [UIColor colorWithRed: RED(color) green: GREEN(color) blue: BLUE(color) alpha: 1.0];
        
        //Keep the size of the view the same,
		//but move the origin to the center of the view.
		CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    }
    return self;
}
*/

- (id) initWithFrame: (CGRect) frame
              string: (NSString *) s
     backgroundColor: (UIColor *) c
               point: (CGPoint) p
                font: (UIFont *) f {
    
	if ((self = [super initWithFrame: frame]) != nil) {
		self.backgroundColor = c;
		self.string = s;
		point = p;	//not an object, doesn't need self.
		self.font = f;
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // should be 3
    NSLog(@"drawRect: self.retainCount == %u", self.retainCount);
    printRectInfo(@"View: drawRect: rect=", rect);
    
    //UIFont *f = [UIFont systemFontOfSize: 32.0];
    //NSString *s = @"Hello, World!";
    //NSString *s = @"هزا مدهش"; //That's amazing! 
    
    //UIDevice *d = [UIDevice currentDevice];	//There is only one object of this class.
	//NSString *s = d.model;		//Is it an iPhone, iPod, or iPad?
	//NSString *s = d.uniqueIdentifier;	//serial number
	//NSString *s = d.systemName;	//name of operating system, e.g. "iPhone OS"
	//NSString *s = d.systemVersion;	//version number of operating system, e.g., "4.3"

    //CGPoint p = CGPointZero; //CGPointMake(0.0, 0.0);
    //CGPoint p = CGPointMake(50, 200);
    
    //CGSize size = [string sizeWithFont: font];
    
    CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c, 0, .5, 1.0, 1.0); //red, green, blue, alpha
	//CGPoint p = CGPointMake(-size.width / 2, -size.height / 2);
    
    [string drawAtPoint: point withFont: font];
    /*
    [@"Hello, World!"
     drawAtPoint: CGPointMake(0, 0)
     withFont: [UIFont systemFontOfSize: 32]
     ];
     */
}

@end

void printRectInfo(NSString *prefix, CGRect myRect)
{
    NSLog(@"%@: origin == (%g, %g), size == %g × %g",
          prefix,
          myRect.origin.x,
          myRect.origin.y,
          myRect.size.width,
          myRect.size.height);
}


