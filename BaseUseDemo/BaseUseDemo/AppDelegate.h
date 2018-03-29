//
//  AppDelegate.h
//  BaseUseDemo
//
//  Created by caoshuaikun on 2018/3/28.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

