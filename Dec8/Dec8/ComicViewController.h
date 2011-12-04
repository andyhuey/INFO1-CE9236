//
//  ComicViewController.h
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComicViewController : UIViewController {
    NSString *fullTitle;
    NSArray *issueInfo;
}

-(id) initWithTitle:(NSString *)t 
          fullTitle:(NSString *)ft
           tabImage:(NSString *)img
          issueInfo:(NSArray *) issInfo; 

@property (nonatomic, copy) NSString *fullTitle;
@property (nonatomic, retain) NSArray *issueInfo;
@end
