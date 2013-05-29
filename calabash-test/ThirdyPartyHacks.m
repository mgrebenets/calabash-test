//
//  ThirdyPartyHacks.m
//  Template
//
//  Created by Gordon Childs on 14/03/13.
//  Copyright (c) 2013 News Limited. All rights reserved.
//

#import "ThirdyPartyHacks.h"
#import <ECSlidingViewController.h>


#if 0
// this comes in handy from time to time.

// http://www.mikeash.com/pyblog/friday-qa-2010-01-29-method-replacement-for-fun-and-profit.html
#import <objc/runtime.h>

static void
MethodSwizzle(Class c, SEL origSEL, SEL overrideSEL) {
	Method origMethod = class_getInstanceMethod(c, origSEL);
	Method overrideMethod = class_getInstanceMethod(c, overrideSEL);
	if(class_addMethod(c, origSEL, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)))
	{
		class_replaceMethod(c, overrideSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
	}
	else
	{
		method_exchangeImplementations(origMethod, overrideMethod);
	}
}
#endif

// Required for re-implementing resetTopViewWithAnimations:onComplete: with interrupted animation fix
@interface ECSlidingViewController (PrivateDecls)
- (CGFloat)resettedCenter;
- (void)updateTopViewHorizontalCenter:(CGFloat)newHorizontalCenter;

- (void)topViewHorizontalCenterWillChange:(CGFloat)newHorizontalCenter;
- (void)topViewHorizontalCenterDidChange:(CGFloat)newHorizontalCenter;
@end

@interface PatchedECSlidingViewController () {
	BOOL	_slideClosing;
}
@end


@implementation PatchedECSlidingViewController
// ECSlidingViewController doesn't implement this.
// TODO: log an issue
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

// such a bad idea setting variables in viewDidLoad
// TODO: log a github issue or change library
- (void)viewDidLoad {
	[super viewDidLoad];
	self.shouldAllowPanningPastAnchor = NO;
}

// TM-186: closing slide menu can't handle being interrupted, so re-implement
// TODO: log a github issue or change library
// TODO: understand why inverse anchorTopViewTo: doesn't have the same problem

// TM-168: closing animation re-entry seems too easy with this library and causes under view to teleport away
// can be done via panningGesture or explicit closing.
- (void)resetTopViewWithAnimations:(void(^)())animations onComplete:(void(^)())complete
{
	// BEGIN TM-168 WORKAROUND
	if(_slideClosing) {
		NSLog(@"resetTopView re-entered\n");
		return;
	}
	
	_slideClosing = YES;	[self topViewHorizontalCenterWillChange:self.resettedCenter];

	UIView *panView = self.panGesture.view;
    panView.accessibilityLabel = @"panView";
    NSLog(@"panView gr: %@", panView.gestureRecognizers);
	[panView removeGestureRecognizer:self.panGesture];
	// END TM-168 WORKAROUND
	
	[UIView animateWithDuration:0.25f animations:^{
		if (animations) {
			animations();
		}
		[self updateTopViewHorizontalCenter:self.resettedCenter];
	} completion:^(BOOL finished) {
		// BEGIN TM-186 WORK AROUND
		// if your animation is somehow interrupted, e.g. by an autorotation
		// state resets back to beginning of animation, so set state to closed
		if(!finished) {
			[self updateTopViewHorizontalCenter:self.resettedCenter];
		}
		// END TM-186 WORK AROUND

		// BEGIN TM-168 WORKAROUND
		NSLog(@"PatchedECSlidingViewController reset finished\n");
		// cancel the pan gesture - not strictly necessary, but avoids some teleporting
		// of panned view
		// NB: do this before adding recognizer back - enable = NO can call
		// stateEnded and depending on velocity can re-open the drawer.
		// this isn't really a cancel. kinda fragile - if this doesn't mop up
		// TM-238 try moving this up to gesture remove or replace this lib.
		self.panGesture.enabled = NO;
		self.panGesture.enabled = YES;

		[panView addGestureRecognizer:self.panGesture];
		
		
		_slideClosing = NO;
		// END TM-168 WORKAROUND

		if (complete) {
			complete();
		}
		[self topViewHorizontalCenterDidChange:self.resettedCenter];
	}];
}

@end
