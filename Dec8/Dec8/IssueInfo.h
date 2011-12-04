//
//  IssueInfo.h
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssueInfo : NSObject {
    NSString *issueImg;
    NSNumber *issueNo;
}

@property (nonatomic, copy) NSString *issueImg;
@property (retain) NSNumber *issueNo;

-(id)initWithImg:(NSString*) img issueNo:(int) issno;
@end
