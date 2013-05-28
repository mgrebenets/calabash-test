//
//  NLCContentViewController.m
//  calabash-test
//
//  Created by Grebenets, Maksym on 5/28/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import "NLCContentViewController.h"
#import <ECSlidingViewController.h>

@interface NLCContentViewController ()

@end

@implementation NLCContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ECSlidingViewController *)slidingViewController
{
    UIViewController *viewController = self.parentViewController;
    while (!(viewController == nil || [viewController isKindOfClass:[ECSlidingViewController class]])) {
        viewController = viewController.parentViewController;
    }
    
    return (ECSlidingViewController *)viewController;
}

- (IBAction)toggleToc:(id)sender {
    NSLog(@"toggleToc:");
    
    if(!self.slidingViewController.underLeftShowing) {
		[self.slidingViewController anchorTopViewTo:ECRight];
	}
}

@end
