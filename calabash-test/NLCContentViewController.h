//
//  NLCContentViewController.h
//  calabash-test
//
//  Created by Grebenets, Maksym on 5/28/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLCContentViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *tocButton;

- (IBAction)toggleToc:(id)sender;

@end
