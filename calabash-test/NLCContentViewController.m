//
//  NLCContentViewController.m
//  calabash-test
//
//  Created by Grebenets, Maksym on 5/28/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import "NLCContentViewController.h"
#import "NLCHyperlinkView.h"
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
    
    self.view.accessibilityLabel = @"content view";
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0];
    self.toolbar.accessibilityLabel = @"toolbar";
    
    int idx = 0;
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[NLCHyperlinkView class]]) {
            NLCHyperlinkView *hlView = (NLCHyperlinkView *)view;
            NSString *urlPath = [NSString stringWithFormat:@"http://hyperlink-%d.com", idx++];
            hlView.hyperlinkText.text = urlPath;
            hlView.foo = [[NLCFooClass alloc] init];
            hlView.foo.url = [NSURL URLWithString:urlPath];
    
        }
    }
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
    
    viewController.view.accessibilityLabel = @"slider view";
    viewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:1.0];
    
    return (ECSlidingViewController *)viewController;
}

- (IBAction)toggleToc:(id)sender {
    NSLog(@"toggleToc:");
    
    if(!self.slidingViewController.underLeftShowing) {
		[self.slidingViewController anchorTopViewTo:ECRight];
	}
}

@end
