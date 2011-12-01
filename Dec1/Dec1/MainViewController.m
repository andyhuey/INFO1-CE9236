//
//  MainViewController.m
//  Dec1
//
//  Created by Andrew Huey on 11/27/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "GridView.h"

@implementation MainViewController

@synthesize A, B, C, isAnimRunning;

-(void)startAnimation {
    NSLog(@"Starting animation...");
    [myGridView initSpiro];
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop: loop forMode: NSDefaultRunLoopMode];
    isAnimRunning = YES;
}

-(void)stopAnimation {
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [displayLink removeFromRunLoop: loop forMode:NSDefaultRunLoopMode];
    [myMainView enableRunBtn];
    isAnimRunning = NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        A = 80;
        B = 14;
        C = 30;
        isAnimRunning = NO;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    myMainView = [[MainView alloc] initWithFrame: frame controller:self];
	self.view = myMainView;    
    self.view.backgroundColor = [UIColor whiteColor];
    [myMainView initBtnRun];
    [myMainView initSlidersWithA:A B:B C:C];

    // put the grid view in the main view.
    CGSize sGV = CGSizeMake(300, 300);
    CGRect gvFrame = CGRectMake(10, 10, sGV.width, sGV.height);
    myGridView = [[GridView alloc] initWithFrame: gvFrame controller:self];
    myGridView.layer.cornerRadius = 15;
    myGridView.clipsToBounds = YES;

    [myMainView addSubview:myGridView];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    displayLink = [CADisplayLink 
                   displayLinkWithTarget: myGridView
                                selector: @selector(move:) ];
    
	displayLink.frameInterval = 2;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    myGridView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
