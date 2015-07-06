//
//  DetailViewController.h
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailViewController : UIViewController


@property (nonatomic, weak) IBOutlet UILabel *sectionIndexLabel;
@property (nonatomic, assign) NSInteger sectionIndex;
@property (nonatomic, retain) PFFile *imageFile;
@property (nonatomic, retain) NSString *titleLabelText;
@property (nonatomic, weak) IBOutlet UILabel *detailedTitleView;
@property (nonatomic, weak) IBOutlet PFImageView* detailedImageView;
@end
