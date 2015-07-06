//
//  FollowButton.h
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//



#import <UIKit/UIKit.h>

@class FollowButton;
@protocol FollowButtonDelegate
- (void) followButton:(FollowButton *)button didTapWithSectionIndex:(NSInteger)index;
@end

@interface FollowButton : UIButton

@property (nonatomic, assign) NSInteger sectionIndex;
@property (nonatomic, weak) id <FollowButtonDelegate> delegate;
@end
