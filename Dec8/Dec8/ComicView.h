//
//  ComicView.h
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ComicViewController;

@interface ComicView : UIView {
    ComicViewController *myViewCtrl;
}

- (id) initWithFrame: (CGRect) frame controller: (ComicViewController *) c;

@end
