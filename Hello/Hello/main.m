//
//  main.m
//  Hello
//
//  Created by Andrew Huey on 10/17/11.
//  Copyright 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSLog(@"Number of arguments == %d", argc);
    
	for (int i = 0; i < argc; ++i) {
		NSLog(@"argv[%d] == %s", i, argv[i]);
	}
    
    int retVal = UIApplicationMain(argc, argv, nil, @"HelloAppDelegate");
    [pool release];
    return retVal;
}
