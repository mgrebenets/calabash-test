//
//  NLCHyperlinkView.h
//  calabash-test
//
//  Created by Grebenets, Maksym on 11/6/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLCFooClass.h"

@interface NLCHyperlinkView : UIView
@property (nonatomic, strong) NLCFooClass *foo;
@property (nonatomic, strong) IBOutlet UILabel *hyperlinkText;
@end
