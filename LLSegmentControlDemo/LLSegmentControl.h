//
//  LLSegmentControl.h
//  LLSegmentControlDemo
//
//  Created by LiLiang on 16/1/26.
//  Copyright © 2016年 LiLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLSegmentControl : UIControl

@property (nonatomic, assign  ) NSInteger  selectedSegmentIndex;
@property (nonatomic, readonly) NSUInteger numberOfSegments;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<NSString *> *)items;

@end
