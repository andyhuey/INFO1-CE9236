//
//  MainView.m
//  Nov10
//
//  Created by Andrew Huey on 11/7/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "MainView.h"
#import "SpiroView.h"

// from http://cocoamatic.blogspot.com/2010/07/uicolor-macro-with-hex-values.html

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        views = [NSArray arrayWithObjects:
                 [[SpiroView alloc] initWithFrame: self.bounds 
                                          bgColor:UIColorFromRGB(0xFFBF40)
                                                A:100 B:14 C:30],
                 [[SpiroView alloc] initWithFrame: self.bounds
                                          bgColor:UIColorFromRGB(0xFFD073)
                                                A:120 B:20 C:42],
                 nil
                 ];
        
		viewIndex = 0;
        SpiroView* view0 = [views objectAtIndex: viewIndex]; 
        [view0 setNeedsInstructions:YES];
		[self addSubview: view0];
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipeLR:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipeLR:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipeUD:)
                      ];
        recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];

		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipeUD:)
                      ];
        recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self 
                                             action: @selector(handleSingle:)
                                             ];
        singleTap.numberOfTapsRequired = 1;
        [self addGestureRecognizer: singleTap];

    }
    return self;
}

- (void) swipeLR: (UISwipeGestureRecognizer *) recognizer {
    
    NSUInteger newIndex = viewIndex ^ 1; 
    NSUInteger transOption;
    
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            // swipe right
            transOption = UIViewAnimationOptionTransitionFlipFromLeft;
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            transOption = UIViewAnimationOptionTransitionFlipFromRight;
            break;
        default:
            break;
    }

    [UIView transitionFromView: [views objectAtIndex: viewIndex]
                        toView: [views objectAtIndex: newIndex]
                      duration: 2.0
                       options: transOption
                    completion: NULL
     ];
    
	viewIndex = newIndex;    
}

- (void) swipeUD: (UISwipeGestureRecognizer *) recognizer {
    // swiping up & down will add/subtract 5 from B.
    SpiroView* currView = [views objectAtIndex: viewIndex];
    
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            [currView tweakB:5];
            break;
        case UISwipeGestureRecognizerDirectionDown:
            [currView tweakB:-5];
            break;
        default:
            break;
    }
}

- (void) handleSingle: (UITapGestureRecognizer *) recognizer {
    SpiroView* sw = [views objectAtIndex:0];
    [sw setNeedsInstructions:NO];
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
