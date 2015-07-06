//
//  ParseLoginViewController.m
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import "ParseLoginViewController.h"

@interface ParseLoginViewController ()

@end

@implementation ParseLoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"Background"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    self.logInView.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CorkedLogoPlain"]];
    [self.logInView.facebookButton setTitle:@"Login with Facebook" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.logInView.facebookButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    
    CGRect frame = self.logInView.logo.frame;
    frame.origin.y = 150;
    self.logInView.logo.frame = frame;
    frame = self.logInView.facebookButton.frame;
    frame.origin.y = 300;
    self.logInView.facebookButton.frame = frame;
}





@end
