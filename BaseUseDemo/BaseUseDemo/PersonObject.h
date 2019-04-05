//
//  PersonObject.h
//  BaseUseDemo
//
//  Created by caoshuaikun on 2018/4/3.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonObject : NSObject <NSCoding>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger age;

@end
