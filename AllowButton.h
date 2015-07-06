//
//  AllowButton.h
//  Corked
//
//  Created by Sarah on 6/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import <UIKit/UIKit.h>

@class AllowButton;
@protocol AllowButtonDelegate
- (void) allowButton:(AllowButton *)button didTapWithSectionIndex:(NSInteger)index;
@end

@interface AllowButton : UIButton

@property (nonatomic, assign) NSInteger sectionIndex;
@property (nonatomic, weak) id <AllowButtonDelegate> delegate;
@end
