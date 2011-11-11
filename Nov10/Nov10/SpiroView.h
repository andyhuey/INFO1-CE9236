//
//  SpiroView.h
//  Nov10
//
//  Created by Andrew Huey on 11/7/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpiroView : UIView {
    int A, B, C;
    BOOL needsInstructions;
}

- (id)initWithFrame:(CGRect)frame 
            bgColor:(UIColor*)bgColor
                  A:(int)a B:(int)b C:(int)c;
-(void)tweakB: (int)bdiff;
-(void) setNeedsInstructions: (BOOL)b;
@end
