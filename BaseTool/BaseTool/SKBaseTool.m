//
//  SKBaseTool.m
//  BaseTool
//
//  Created by caoshuaikun on 2018/3/13.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "SKBaseTool.h"

@implementation SKBaseTool

+ (void)testOne {
    NSLog(@"Hello word!");
}

//image切圆角
+ (UIImage *)imageWithRoundCorner:(UIImage *)sourceImage cornerRadius:(CGFloat)cornerRadius size:(CGSize)size {
    
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGRect bounds = CGRectMake(0, 0, size.width, size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:cornerRadius];
    [path addClip];
    
    [sourceImage drawInRect:bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//view切圆角
+ (void)viewClipCorners:(UIView *)sourseView cornerRadSize:(CGSize)cornerRadSize {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:sourseView.bounds
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:cornerRadSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = sourseView.bounds;//设置大小
    maskLayer.path = maskPath.CGPath;//设置图形样子
    sourseView.layer.mask = maskLayer;
    
}

@end
