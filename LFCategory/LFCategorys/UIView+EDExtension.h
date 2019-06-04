//
//  UIView+EDExtension.h
//  EDBaseProject
//
//  Created by ios on 15/12/30.
//  Copyright © 2015年 Eesyder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EDExtension)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

//- (CGFloat)x;
//- (void)setX:(CGFloat)x;

+ (instancetype)viewFromXib;

// 删除线  (在view中间画一条高度为1的线--使用CAShapeLayer)
- (void)addHorizontalLineWithColor:(UIColor *)lineColor;

// 画虚线  （在view范围内画满栅栏--使用CAShapeLayer）
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

// 画边框  (画虚边框--使用CAShapeLayer)
+ (void)drawBorderLine:(UIView *)lineView viewWidth:(int)viewWidth cornerRadius:(int)cornerRadius lineColor:(UIColor *)lineColor;


- (void)addTarget:(id)target action:(SEL)action;


/** Creates a snapshot of the receiver. */
- (UIImage *)snapshotImage;

/** Sets the corner attributes of the receiver's layer. */
- (void)setRoundedCornersWithRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;

/** Adds a layer-based shadow to the receiver. */
//- (void)addShadowWithColor:(UIColor *)color alpha:(CGFloat)alpha radius:(CGFloat)radius offset:(CGSize)offset;


/** sets the shadow path to fit the receiver's bounds. */
- (void)updateShadowPathToBounds:(CGRect)bounds withDuration:(NSTimeInterval)duration;



//获取该视图的控制器
- (UIViewController*) viewController;

//删除当前视图内的所有子视图
- (void)removeChildViews;

//删除tableview底部多余横线
- (void)setExtraCellLineHidden: (UITableView *)tableView;

- (void)setupViewColor;

@end
