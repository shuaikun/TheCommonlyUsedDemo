//
//  PersonObject.m
//  BaseUseDemo
//
//  Created by caoshuaikun on 2018/4/3.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "PersonObject.h"

@implementation PersonObject

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeInt64ForKey:@"age"];
    }
    return self;
}

@end
