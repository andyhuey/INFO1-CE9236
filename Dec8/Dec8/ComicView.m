//
//  ComicView.m
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "ComicView.h"
#import "ComicViewController.h"
#import "IssueInfo.h"

@implementation ComicView

- (id)initWithFrame:(CGRect)frame controller: (ComicViewController *) c
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        myViewCtrl = c;
    }
    return self;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	[myViewCtrl nextIssue];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIFont *font = [UIFont systemFontOfSize: 20.0];
    NSString *s = //[NSString stringWithString: myViewCtrl.fullTitle];
    [NSString stringWithFormat:@"%@ # %d", myViewCtrl.fullTitle, 
     [myViewCtrl.issueInfo.issueNo intValue]];
    CGPoint point = CGPointMake(10, 10);
    [s drawAtPoint: point withFont: font];
    
    if (![myViewCtrl.issueInfo.issueImg isEqualToString:@"todo"])
    {
        // display the image
        UIImage *cover = [UIImage imageWithData:
               [NSData dataWithContentsOfURL:[NSURL URLWithString:myViewCtrl.issueInfo.issueImg]]];
        [cover drawAtPoint:CGPointMake(10, 40)];
    }
}

@end
