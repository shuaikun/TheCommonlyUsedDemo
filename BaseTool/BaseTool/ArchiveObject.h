//
//  ArchiveObject.h
//  BaseTool
//
//  Created by caoshuaikun on 2018/3/28.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveObject : NSObject <NSCoding>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger age;

@end
