//
//  BaseTool.h
//  BaseTool
//
//  Created by caoshuaikun on 2018/3/13.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for BaseTool.
FOUNDATION_EXPORT double BaseToolVersionNumber;

//! Project version string for BaseTool.
FOUNDATION_EXPORT const unsigned char BaseToolVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BaseTool/PublicHeader.h>

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define BG_COLOR UIColorFromRGB(0xefeff4)

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
