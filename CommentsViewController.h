//
//  CommentsViewController.h
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import "SLKTextViewController.h"
#import <Parse/Parse.h>
@interface CommentsViewController : SLKTextViewController

@property (nonatomic, strong) PFObject *photo;
@end
