//
//  ComicViewController.m
//  Dec8
//
//  Created by Andrew Huey on 12/4/11.
//  Copyright (c) 2011 EVI. All rights reserved.
//

#import "ComicViewController.h"
#import "MyAppDelegate.h"
#import "ComicView.h"
#import "IssueInfo.h"

@implementation ComicViewController

@synthesize fullTitle, issueInfo, tabImageName;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

-(id) initWithTitle:(NSString *)t 
          fullTitle:(NSString *)ft 
           tabImage:(NSString *)img
          issueInfo:(IssueInfo *) issInfo {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        self.tabImageName = img;
        self.tabBarItem.image = [UIImage imageNamed:self.tabImageName];
        self.tabBarItem.title = t;
        self.navigationItem.title = [NSString stringWithFormat:@"%@ # %d", t, 
                                     [issInfo.issueNo intValue]];
        //self.title = [NSString stringWithFormat:@"%@ # %d", ft, 
        //              [issInfo.issueNo intValue]];
        self.fullTitle = ft;
        self.issueInfo = issInfo;
    }
    return self;

}

- (void) nextIssue {
	UIApplication *application = [UIApplication sharedApplication];
	MyAppDelegate *appDelegate = application.delegate;
	[appDelegate nextIssue:self.tabBarItem.title];
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
	self.view = [[ComicView alloc] initWithFrame: frame controller: self];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
