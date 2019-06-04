//
//  UIView+EDExtension.m
//  EDBaseProject
//
//  Created by ios on 15/12/30.
//  Copyright © 2015年 Eesyder. All rights reserved.
//

#import "UIView+EDExtension.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (EDExtension)
NSString *shadowContext = @"Shadow";

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (BOOL)isShowingOnKeyWindow
{
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)addHorizontalLineWithColor:(UIColor *)lineColor
{
    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(CGRectGetMinX(self.bounds), CGRectGetMidY(self.bounds))];
    [linePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds))];
    line.path = linePath.CGPath;
    line.fillColor = nil;
    line.opacity = 1.0;
    line.strokeColor = lineColor.CGColor;
    [self.layer addSublayer:line];
}

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+ (void)drawBorderLine:(UIView *)lineView viewWidth:(int)viewWidth cornerRadius:(int)cornerRadius lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.strokeColor = lineColor.CGColor;
    
    shapeLayer.fillColor = nil;
    
    CGRect frame = lineView.bounds;
    frame.size.width = viewWidth;
    
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:cornerRadius].CGPath;
    
    shapeLayer.frame = frame;
    
    shapeLayer.lineWidth = .5f;
    
    shapeLayer.lineCap = @"square";
    
    shapeLayer.lineDashPattern = @[@4, @2];

    [lineView.layer addSublayer:shapeLayer];
}



- (UIImage *)snapshotImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)setRoundedCornersWithRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = width;
    
    if (color)
    {
        self.layer.borderColor = color.CGColor;
    }
}

//- (void)addShadowWithColor:(UIColor *)color alpha:(CGFloat)alpha radius:(CGFloat)radius offset:(CGSize)offset
//{
//    self.layer.shadowOpacity = alpha;
//    self.layer.shadowRadius = radius;
//    self.layer.shadowOffset = offset;
//    
//    if (color)
//    {
//        self.layer.shadowColor = [color CGColor];
//    }
//    
//    // cannot have masking
//    self.layer.masksToBounds = NO;
//}

- (void)updateShadowPathToBounds:(CGRect)bounds withDuration:(NSTimeInterval)duration
{
    CGPathRef oldPath = self.layer.shadowPath;
    CGPathRef newPath = CGPathCreateWithRect(bounds, NULL);
    
    if (oldPath && duration>0)
    {
        CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
        theAnimation.duration = duration;
        theAnimation.fromValue = (__bridge id)oldPath;
        theAnimation.toValue = (__bridge id)newPath;
        theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.layer addAnimation:theAnimation forKey:@"shadowPath"];
    }
    
    self.layer.shadowPath = newPath;
    
    CGPathRelease(newPath);
}


//获取该视图的控制器
- (UIViewController*) viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

//删除当前视图内的所有子视图
- (void)removeChildViews{
    for (UIView *cv in self.subviews) {
        [cv removeFromSuperview];
    }
}


//删除tableview底部多余横线
- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
}

- (void)addTarget:(id)target action:(SEL)action;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

- (void)setupViewColor {
    self.backgroundColor = [UIColor blueColor];
}

@end
