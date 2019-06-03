//
//  UIView+Extension.h
//  01-黑酷
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

CGRect CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGRect CGRectMake750(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGRect CGRectMake2(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGSize CGSizeMake2(CGFloat width, CGFloat height);
CGSize CGSizeMake750(CGFloat width, CGFloat height);
UIEdgeInsets UIEdgeInsetsMake750(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
CGFloat lineRatio750(CGFloat space);
@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


/**
 *  9.上 < Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat top;

/**
 *  10.下 < Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 *  11.左 < Shortcut for frame.origin.x.
 */
@property (nonatomic) CGFloat left;

/**
 *  12.右 < Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat right;


@end
