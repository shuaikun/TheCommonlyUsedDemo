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

@end
