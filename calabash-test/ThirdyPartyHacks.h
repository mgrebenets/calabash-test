//
//  ThirdyPartyHacks.h
//  Template
//
//  Created by Gordon Childs on 14/03/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ECSlidingViewController.h"

// a version that doesn't pan past anchor point
@interface PatchedECSlidingViewController : ECSlidingViewController
@end

@interface ThirdyPartyHacks : NSObject

+ (void)disableUIWebViewShadow:(UIWebView *)webView;
+ (void)themeUIWebView:(UIWebView *)webView;

@end
