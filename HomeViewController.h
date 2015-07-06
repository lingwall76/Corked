//
//  HomeViewController.h
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import <Parse/Parse.h>
#import "FollowButton.h"
#import "DetailButton.h"

@interface HomeViewController : PFQueryTableViewController <FollowButtonDelegate>

@end
