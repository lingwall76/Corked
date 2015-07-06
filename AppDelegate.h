//
//  AppDelegate.h
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ParseLoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, PFLogInViewControllerDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableData *profilePictureData;

- (void)presentLoginControllerAnimated:(BOOL)animated;
@end
