//
//  ComicView.m
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "ComicView.h"
#import "ComicViewController.h"

@implementation ComicView

- (id)initWithFrame:(CGRect)frame controller: (ComicViewController *) c
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        myViewCtrl = c;
    }
    return self;
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
