//
//  NLCSharingViewController.m
//  calabash-test
//
//  Created by Grebenets, Maksym on 10/24/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import "NLCSharingViewController.h"

@interface NLCSharingViewController ()
@property (nonatomic, strong) UIPopoverController *popoverCtl;
@end

@implementation NLCSharingViewController

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

- (IBAction)touchSharing:(id)sender {
    
    NSArray *applicationActivities = nil;
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"data"] applicationActivities:applicationActivities];
    activityViewController.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypePostToWeibo];

    if (!self.popoverCtl) {
        self.popoverCtl = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
    }
    [self.popoverCtl presentPopoverFromRect:self.sharingButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end
