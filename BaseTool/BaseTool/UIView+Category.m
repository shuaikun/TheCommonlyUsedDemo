//
//  UIView+Category.m
//  BaseTool
//
//  Created by caoshuaikun on 2018/3/23.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)setSk_size:(CGSize)sk_size
{
    CGRect frame = self.frame;
    frame.size = sk_size;
    self.frame = frame;
}

- (CGSize)sk_size
{
    return self.frame.size;
}

- (void)setSk_width:(CGFloat)sk_width
{
    if (isnan(sk_width)) {
        
        return;
    }
    CGRect frame = self.frame;
    frame.size.width = sk_width;
    self.frame = frame;
}

- (void)setSk_height:(CGFloat)sk_height
{
    if (isnan(sk_height)) {
        
        return;
    }
    CGRect frame = self.frame;
    frame.size.height = sk_height;
    self.frame = frame;
}

- (void)setSk_x:(CGFloat)sk_x
{
    if (isnan(sk_x)) {
        
        return;
    }
    CGRect frame = self.frame;
    frame.origin.x = sk_x;
    self.frame = frame;
}

- (void)setSk_y:(CGFloat)sk_y
{
    CGRect frame = self.frame;
    frame.origin.y = sk_y;
    self.frame = frame;
}

- (void)setSk_centerX:(CGFloat)sk_centerX
{
    CGPoint center = self.center;
    center.x = sk_centerX;
    self.center = center;
}

- (void)setSk_centerY:(CGFloat)sk_centerY
{
    CGPoint center = self.center;
    center.y = sk_centerY;
    self.center = center;
}

- (CGFloat)sk_centerY
{
    return self.center.y;
}

- (CGFloat)sk_centerX
{
    return self.center.x;
}

- (CGFloat)sk_width
{
    return self.frame.size.width;
}

- (CGFloat)sk_height
{
    return self.frame.size.height;
}

- (CGFloat)sk_x
{
    return self.frame.origin.x;
}

- (CGFloat)sk_y
{
    return self.frame.origin.y;
}

@end
