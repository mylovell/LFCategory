//
//  UIView+Extension.m
//  01-黑酷
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIView+Extension.h"
#import "AppDelegate.h"


CGRect CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    CGRect rect;
    rect.origin.x = x * myDelegate.sizeX;
    rect.origin.y = y * myDelegate.sizeY;
    rect.size.width = width * myDelegate.sizeX;
    rect.size.height = height * myDelegate.sizeY;
    return rect;
}

CGRect CGRectMake750(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    CGRect rect;
    rect.origin.x = x * myDelegate.size750X;
    rect.origin.y = y * myDelegate.size750Y;
    rect.size.width = width * myDelegate.size750X;
    rect.size.height = height * myDelegate.size750Y;
    return rect;
}

// CGPoint 不变，等比改变宽高
CGRect CGRectMake2(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    CGRect rect;
    rect.origin.x = x;
    rect.origin.y = y;
    rect.size.width = width * myDelegate.sizeX;
    rect.size.height = height * myDelegate.sizeY;
    return rect;
}

CGSize CGSizeMake2(CGFloat width, CGFloat height)
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    CGSize rect;
    rect.width = width * myDelegate.sizeX;
    rect.height = height * myDelegate.sizeY;

    return rect;
}

CGSize CGSizeMake750(CGFloat width, CGFloat height)
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    CGSize rect;
    rect.width = width * myDelegate.size750X;
    rect.height = height * myDelegate.size750X;
    
    return rect;
}
UIEdgeInsets UIEdgeInsetsMake750(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UIEdgeInsets edgeInsets = UIEdgeInsetsZero;
    edgeInsets.top = top * myDelegate.size750Y;
    edgeInsets.left = left * myDelegate.size750X;
    edgeInsets.bottom = bottom * myDelegate.size750Y;
    edgeInsets.right = right * myDelegate.size750X;
    return edgeInsets;
}

CGFloat lineRatio750(CGFloat space) {
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return space * myDelegate.size750X;
}

@implementation UIView (Extension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
//    self.width = size.width;
//    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}


- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


@end
