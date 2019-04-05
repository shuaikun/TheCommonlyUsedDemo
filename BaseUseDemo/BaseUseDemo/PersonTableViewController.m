//
//  PersonTableViewController.m
//  BaseUseDemo
//
//  Created by caoshuaikun on 2018/3/28.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "PersonTableViewController.h" 
#import "PersonObject.h"

@interface PersonTableViewController ()

@property (nonatomic, strong) NSMutableArray * mutableArray;

@end

@implementation PersonTableViewController

- (NSMutableArray *)mutableArray {
    if (!_mutableArray) {
        _mutableArray = [NSMutableArray array];
    }
    return _mutableArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

//归档
- (IBAction)archiver:(id)sender {
    PersonObject * person = [[PersonObject alloc] init];
    person.name = @"你好";
    person.age = 20;
    
//    NSString * stringPath = [NSHomeDirectory() stringByAppendingPathComponent:@"giveMe"];
//    BOOL success = [NSKeyedArchiver archiveRootObject:person toFile:stringPath];
//    if (success) {
//        NSLog(@" success ");
//    } else {
//        NSLog(@" fail ");
//    }
    //准备路径:
    NSString *path = NSHomeDirectory();
    NSLog(@"%@",path);

    path = [path stringByAppendingPathComponent:@"singeGirl.txt"];
    //1:准备存储数据的对象
    NSMutableData *data = [NSMutableData data];
    //2:创建归档对象
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //3:开始归档
    [archiver encodeObject:person forKey:@"person"];
    //4:完成归档
    [archiver finishEncoding];
    //5:写入文件当中
    BOOL result = [data writeToFile:path atomically:YES];
    if (result) {
        NSLog(@"归档成功:%@",path);
    } else {
        NSLog(@"归档不成功!!!");
    }
}

//解档
- (IBAction)unArchiver:(id)sender {
    
//    NSString * path = [NSHomeDirectory() stringByAppendingString:@"giveMe"];
//    id array = [[ArchiveObject new] decodeObjectForKey:path];
//    NSLog(@" 解析出来的 %@",array);
    NSString * path = NSHomeDirectory();
    //准备解档路径
    NSData *myData = [NSData dataWithContentsOfFile:path];
    //创建反归档对象
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:myData];
    //反归档
    PersonObject *unArchiverObject = [[PersonObject alloc] init];
    unArchiverObject = [unarchiver decodeObjectForKey:@"person"];
    //完成反归档
    [unarchiver finishDecoding];

    [self.mutableArray addObject:unArchiverObject];
    NSLog(@"%@",self.mutableArray);
//    [self.tableView reloadData];
}

#pragma mark - tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mutableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    PersonObject * archive = self.mutableArray[indexPath.row];
    cell.textLabel.text = archive.name;
    return cell;
}

#pragma mark - tableViweDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
