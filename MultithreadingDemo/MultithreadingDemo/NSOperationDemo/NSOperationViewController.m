//
//  NSOperationViewController.m
//  MultithreadingDemo
//
//  Created by caoshuaikun on 2018/3/13.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "NSOperationViewController.h"

@interface NSOperationViewController ()

@property (nonatomic, strong) NSLock * lock;

@end

@implementation NSOperationViewController

//http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lock = [[NSLock alloc] init];
    [self operationQueue];
//    [self queueBlock];
//    [self operationQueueLongRunning];
    
    //关于点击push的时候出现卡死问题是因为，不管是NSBlockOperation，还是NSInvocationOperation单独使用的时候都是同步的，不是异步的，只有添加到queue中才会成为异步的。
//    [self singleBlockOperation];
//    [self singleInvocationOperation];
}

- (void)operationQueue {
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
//    queue.maxConcurrentOperationCount = 1;
    
    NSInvocationOperation * invocationOperation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(logData) object:nil];
    invocationOperation1.qualityOfService = NSQualityOfServiceBackground;
    
    NSInvocationOperation * invocationOperation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(logData) object:nil];
    invocationOperation2.qualityOfService = NSQualityOfServiceUtility;
    
    NSBlockOperation * blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
        [self.lock unlock];
    }];
    
    [blockOperation addExecutionBlock:^{
        [self.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
        [self.lock unlock];
    }];
    
    blockOperation.qualityOfService = NSQualityOfServiceUserInteractive;
    
    
//    [invocationOperation2 addDependency:invocationOperation1];
//    [blockOperation addDependency:invocationOperation2];
    [queue addOperation:invocationOperation1];
    [queue addOperation:invocationOperation2];
    [queue addOperation:blockOperation];
}

- (void)logData {
    
    [self.lock lock];
    for (int i = 0; i < 2; i++) {
        NSLog(@"%@",[NSThread currentThread]);
    }
    [self.lock unlock];
}

- (void)queueBlock {
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [queue addOperationWithBlock:^{
        [weakSelf.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
        [weakSelf.lock unlock];
    }];
    [queue addOperationWithBlock:^{
//        [weakSelf.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
//        [weakSelf.lock unlock];
    }];
    [queue addOperationWithBlock:^{
//        [weakSelf.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
//        [weakSelf.lock unlock];
    }];
}

//耗时操作
- (void)operationQueueLongRunning {
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [queue addOperationWithBlock:^{
        //耗时操作
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png"]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
          //刷新ui等
            weakSelf.bottomImageView.image = [UIImage imageWithData:data];
        }];
    }];
}

//单个线程的运行
- (void)singleInvocationOperation {
    NSInvocationOperation * invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(logData) object:nil];
    [invocationOperation start];
}

- (void)singleBlockOperation {
    __weak typeof(self) weakSelf = self;
//    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation * blockOperation = [[NSBlockOperation alloc] init]; 
    [blockOperation addExecutionBlock:^{
        [weakSelf.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
        [weakSelf.lock unlock];
    }];
    [blockOperation addExecutionBlock:^{
        [weakSelf.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
        [weakSelf.lock unlock];
    }];
    [blockOperation addExecutionBlock:^{
        [weakSelf.lock lock];
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
        [weakSelf.lock unlock];
    }];
//    [queue addOperation:blockOperation];
    [blockOperation start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
