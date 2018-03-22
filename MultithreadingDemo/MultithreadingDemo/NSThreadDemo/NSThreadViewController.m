//
//  NSThreadViewController.m
//  MultithreadingDemo
//
//  Created by caoshuaikun on 2018/3/9.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "NSThreadViewController.h"
#import <AFNetworking.h>
#import <BaseTool/SKBaseTool.h>

@interface NSThreadViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *threadImageView;
@property (nonatomic, strong) NSLock * globalLock;

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [SKBaseTool testOne];
    [self downLoadImage];
}

- (void)downLoadImage {
    self.globalLock = [[NSLock alloc] init];
    
    NSThread * thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(downLoadImageAction:) object:@{@"shuai":@"need1"}];
    [thread1 setQualityOfService:NSQualityOfServiceBackground];
//    thread1.name = @"1";
    [thread1 start];
    
    NSThread * thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(downLoadImageAction:) object:@{@"shuai":@"need2"}];
    [thread2 setQualityOfService:NSQualityOfServiceUserInteractive];
//    thread2.name = @"2";
    [thread2 start];
    
    NSThread * thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(downLoadImageAction:) object:@{@"shuai":@"need3"}];
    [thread3 setQualityOfService:NSQualityOfServiceDefault];
//    thread3.name = @"3";
    [thread3 start];
}

- (void)downLoadImageAction:(NSDictionary *)sender {
  
    //线程加锁
    [self.globalLock lock];
//    NSLog(@"%@",sender);
    for (int i = 0; i < 2; i++) {
        NSLog(@"输出线程名字和数字：%@-%d",[NSThread currentThread],i);
    }
    //线程解锁
    [self.globalLock unlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
