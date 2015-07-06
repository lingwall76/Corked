//
//  DetailViewController.m
//  ubercam
//
//  Created by Daniel Sheng Xu on 2015-05-12.
//  Copyright (c) 2015 danielxu. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2;
    self.profileImageView.layer.masksToBounds = YES;

    // Do any additional setup after loading the view.
    self.sectionIndexLabel.text = [NSNumber numberWithInteger:self.sectionIndex].stringValue;
    self.detailedTitleView.text = self.titleLabelText;
    self.detailedImageView.file = self.imageFile;
    [self.detailedImageView loadInBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Tried to get user profile who posted photo in controller

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self updateUserStatus];
//}
//
//
//- (void)updateUserStatus {
//    PFUser *user = [PFUser currentUser];
//    self.profileImageView.file = user[@"profilePicture"];
//    [self.profileImageView loadInBackground];
//    self.userNameLabel.text = user.username;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
