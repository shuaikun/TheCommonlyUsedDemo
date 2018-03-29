//
//  SKBaseTool.h
//  BaseTool
//
//  Created by caoshuaikun on 2018/3/13.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SKBaseTool : NSObject

+ (void)testOne;

//给图片切圆角
+ (UIImage *)imageWithRoundCorner:(UIImage *)sourceImage cornerRadius:(CGFloat)cornerRadius size:(CGSize)size;

@end
