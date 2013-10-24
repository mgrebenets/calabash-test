//
//  NLCSharingViewController.h
//  calabash-test
//
//  Created by Grebenets, Maksym on 10/24/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLCSharingViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *sharingButton;
- (IBAction)touchSharing:(id)sender;

@end
