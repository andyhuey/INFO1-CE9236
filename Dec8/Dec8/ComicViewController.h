//
//  ComicViewController.h
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComicViewController : UIViewController {
    NSString *title;
    NSArray *issueNos;
    NSArray *issueImgs;
}

-(id) initWithTitle:(NSString *)t 
           issueNos:(NSArray *) issNo 
          issueImgs:(NSArray *) issImg;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSArray *issueNos;
@property (nonatomic, retain) NSArray *issueImgs;
@end
