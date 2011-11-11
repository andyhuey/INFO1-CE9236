//
//  MainView.h
//  Nov10
//
//  Created by Andrew Huey on 11/7/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView {
    // holds the two subviews we transtion between
	NSArray *views;
    
	// index of the currently displayed sub-view: 0 or 1
	NSUInteger viewIndex;
}

@end
