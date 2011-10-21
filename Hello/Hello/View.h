//
//  View.h
//  Hello
//
//  Created by Andrew Huey on 10/17/11.
//  Copyright 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView {
NSString *string;
CGPoint point;
UIFont *font;
}
@property (nonatomic, copy) NSString *string;
@property (nonatomic) CGPoint point;
@property (nonatomic, retain) UIFont *font;

- (id) initWithFrame: (CGRect) frame
              string: (NSString *) s
     backgroundColor: (UIColor *) c
               point: (CGPoint) p
                font: (UIFont *) f;

@end

// one random unrelated util function.
void printRectInfo(NSString *prefix, CGRect myRect);