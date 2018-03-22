//
//  GCDViewController.m
//  MultithreadingDemo
//
//  Created by caoshuaikun on 2018/3/12.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@property (nonatomic, strong) dispatch_queue_t globalQueue;
@property (nonatomic, strong) dispatch_queue_t mainQueue;
@property (nonatomic, strong) dispatch_queue_t userQueue;
@property (nonatomic, strong) dispatch_group_t groupQueue;
@property (nonatomic, strong) NSLock * lock;
@property (nonatomic, strong) NSDictionary * tmpDic;
@property (nonatomic, strong) NSArray * tmpArray;

@end

@implementation GCDViewController
- (NSArray *)tmpArray {
    if (!_tmpArray) {
        _tmpArray = @[@"name",@"age",@"height",@"school"];
    }
    return _tmpArray;
}
- (NSDictionary *)tmpDic {
    if (!_tmpDic) {
        _tmpDic = @{@"name":@"shuai",@"age":@"22",@"height":@"180"};
    }
    return _tmpDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lock = [[NSLock alloc] init];
    self.globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.mainQueue = dispatch_get_main_queue();
    self.groupQueue = dispatch_group_create();
    
    //DISPATCH_QUEUE_CONCURRENT 并行
    //DISPATCH_QUEUE_SERIAL 串行
    self.userQueue = dispatch_queue_create("userQueue", DISPATCH_QUEUE_SERIAL);
    
//    [self deadlock];
//    [self afterGCD];
//    [self applyGCD];
//    [self groupQueueForOrder];
//    [self queueAction];
//    [self enterGroupAndLeave];
}

//简单使用耗时操作和刷新ui
- (void)sempleUser {
    dispatch_async(self.userQueue, ^{
        //做一些耗时操作
        
        dispatch_async(self.mainQueue, ^{
            //刷新ui
            
        });
    });
}
- (void)enterGroupAndLeave {
    
    __weak typeof(self) weakSelf = self;
    //不使用dispatch_group_async 的情况下加入group
    dispatch_group_enter(self.groupQueue);
    dispatch_async(self.userQueue, ^{
        sleep(2.0);
        NSLog(@"A");
        dispatch_group_leave(weakSelf.groupQueue);
    });
    
    dispatch_group_enter(self.groupQueue);
    dispatch_async(self.userQueue, ^{
        sleep(2.0);
        NSLog(@"B");
        dispatch_group_leave(weakSelf.groupQueue);
    });
    dispatch_group_notify(self.groupQueue, self.userQueue, ^{
        NSLog(@"完成操作");
        
    });
    
}

- (void)queueAction {
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.userQueue, ^{
//        [weakSelf.lock lock];
        sleep(2.0);
        NSLog(@"A");
//        [weakSelf.lock unlock];
    });
    dispatch_async(self.userQueue, ^{
//        [weakSelf.lock lock];
        sleep(2.0);
        NSLog(@"B");
//        [weakSelf.lock unlock];
    });
    dispatch_barrier_async(self.userQueue, ^{
        NSLog(@"加个栅栏");
    });
    dispatch_async(self.userQueue, ^{
//        [weakSelf.lock lock];
        sleep(2.0);
        NSLog(@"C");
//        [weakSelf.lock unlock];
    });
    dispatch_async(self.userQueue, ^{
//        [weakSelf.lock lock];
        sleep(2.0);
        NSLog(@"D");
//        [weakSelf.lock unlock];
    });
}

- (void)groupQueueAction {
    
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        NSLog(@"A");
    });
    dispatch_wait(self.groupQueue, DISPATCH_TIME_FOREVER);
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        NSLog(@"B");
    });
    dispatch_wait(self.groupQueue, DISPATCH_TIME_FOREVER);
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        NSLog(@"C");
    });
    dispatch_wait(self.groupQueue, DISPATCH_TIME_FOREVER);
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        NSLog(@"D");
    });
    dispatch_wait(self.groupQueue, DISPATCH_TIME_FOREVER);
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        NSLog(@"E");
    });
    dispatch_wait(self.groupQueue, DISPATCH_TIME_FOREVER);
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        NSLog(@"F");
    });
    dispatch_wait(self.groupQueue, DISPATCH_TIME_FOREVER);
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        NSLog(@"G");
    });
    dispatch_group_notify(self.groupQueue, self.userQueue, ^{
        NSLog(@"全部完成");
    });
}

- (void)groupQueueForOrder {
    
    __weak typeof(self) weakSelf = self;
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"A");
        [weakSelf.lock unlock];
    });
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"B");
        [weakSelf.lock unlock];
    });
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"C");
        [weakSelf.lock unlock];
    });
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"D");
        [weakSelf.lock unlock];
    });
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"E");
        [weakSelf.lock unlock];
    });
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"F");
        [weakSelf.lock unlock];
    });
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"G");
        [weakSelf.lock unlock];
    });
    dispatch_group_async(self.groupQueue, self.userQueue, ^{
        [weakSelf.lock lock];
        NSLog(@"H");
        [weakSelf.lock unlock];
    });
    dispatch_group_notify(self.groupQueue, self.userQueue, ^{
        NSLog(@"全部完成");
    });
}

- (void)deadlock {
    
    NSLog(@"A");
    dispatch_sync(self.mainQueue, ^{
        NSLog(@"B");
    });
    NSLog(@"C");
}

- (void)afterGCD {
    NSLog(@" --- ");
    
    //几秒之后进行执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"shuai");
    });
}

- (void)applyGCD {
    
    NSLog(@"apply---begin");
    dispatch_apply(self.tmpArray.count, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t indext) {
        NSLog(@"%@---%@",[self.tmpArray objectAtIndex:indext], [NSThread currentThread]);
    });
    NSLog(@"apply---end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
