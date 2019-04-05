//
//  ViewController.m
//  demo
//
//  Created by caoshuaikun on 2018/4/3.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //归档
    //1:获取路径
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    
    path = [path stringByAppendingString:@"custom.plist"];
    
    NSMutableData *data = [NSMutableData data];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:@"111" forKey:@"name"];
    [archiver encodeInteger:20 forKey:@"age"];
    
    [archiver finishEncoding];
    
    BOOL result = [data writeToFile:path atomically:YES];
    if (result) {
        NSLog(@"归档%@",path);
    }
    NSData *newdata = [NSData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *unkeyed =  [[NSKeyedUnarchiver alloc]initForReadingWithData:newdata];
    //    NSString *str1 = [unkeyed decodeObjectForKey:@"name"];
    //    NSString *str2 = [unkeyed decodeObjectForKey:@"gender"];
    //    NSString *str3 = [unkeyed decodeObjectForKey:@"age"];
    
    Person *pp = [Person new];
    pp.name = [unkeyed decodeObjectForKey:@"name"];
    pp.age = [unkeyed decodeIntegerForKey:@"age"];
    [unkeyed finishDecoding];
    NSLog(@"name:%@ age:%zd",pp.name,pp.age);
    //    NSLog(@"name:%@ gender:%@ age:%@",str1,str2,str3);
    
    
    
    
//    Person *per = [Person new];
//    per.name = @"甲甲";
//    per.age = 20;
////    per.gender = @"女";
//
//    //归档
//    //1:准备路径
//    NSString *path = NSHomeDirectory();
//    path = [path stringByAppendingString:@"Singel.plist"];
//    //2:准备存储数据对象(用可变数组进行接收)
//    NSMutableData *data = [NSMutableData new];
//    //3:创建归档对象
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//    //4:开始归档
//    [archiver encodeObject:per forKey:@"person"];
//    //5:完成归档
//    [archiver finishEncoding];
//    //6:写入文件
//    BOOL result = [data writeToFile:path atomically:YES];
//    if (result) {
//        NSLog(@"归档成功:%@",path);
//    }
//
//    //反归档
//    //1:获取解档路径
//    NSData *MyData = [NSData dataWithContentsOfFile:path];
//    //2:创建反归档对象
//    NSKeyedUnarchiver  *unarchiver= [[NSKeyedUnarchiver alloc]initForReadingWithData:MyData];
//    //3:反归档
//    Person *aper = [Person new];
//    aper = [unarchiver decodeObjectForKey:@"person"];
//    //4:结束归档
//    [unarchiver finishDecoding];
//    NSLog(@"%@",aper.name);

    
    
    
    
    
//    //归档
//    //1:创建路径
//    NSString *Doucuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
//    NSString *path = [Doucuments stringByAppendingString:@"file.plist"];
//    //2:归档(不需要结束方法)
//    NSArray *array = @[@"jiajia",@"jiejie",@"pangpang"];
//    BOOL result = [NSKeyedArchiver archiveRootObject:array toFile:path];
//    if (result) {
//        NSLog(@"框架中的归档%@",path);
//    }
//    //反归档
//    NSArray *newArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    NSLog(@"框架的结档%@",newArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
