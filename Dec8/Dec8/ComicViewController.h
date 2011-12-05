//
//  ComicViewController.h
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IssueInfo;

@interface ComicViewController : UIViewController {
    NSString *fullTitle;
    NSString *tabImageName;
    IssueInfo *issueInfo;
}

-(id) initWithTitle:(NSString *)t 
          fullTitle:(NSString *)ft
           tabImage:(NSString *)img
          issueInfo:(IssueInfo *) issInfo; 

- (void) nextIssue;

@property (nonatomic, copy) NSString *fullTitle;
@property (nonatomic, copy) NSString *tabImageName;
@property (nonatomic, retain) IssueInfo *issueInfo;
@end
