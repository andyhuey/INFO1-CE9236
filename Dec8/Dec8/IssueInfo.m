//
//  IssueInfo.m
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "IssueInfo.h"

@implementation IssueInfo

@synthesize issueImg, issueNo;

-(id)initWithImg:(NSString*) img issueNo:(int) issno {
    self = [super init];
    if (self) {
        self.issueImg = img;
        self.issueNo = [NSNumber numberWithInt:issno];
    }
    return self;
}

@end
