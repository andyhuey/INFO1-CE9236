//
//  View.h
//  YinYang
//
//  Created by Andrew Huey on 10/24/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
@class MySubView;

@interface View : UIView {
    BOOL firstTime;
    CGFloat angle;
    MySubView *mySubView;
    AVAudioPlayer *player;
}

@property (nonatomic, retain) AVAudioPlayer *player;

@end
