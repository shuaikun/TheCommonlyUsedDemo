//
//  PersonTableViewController.m
//  BaseUseDemo
//
//  Created by caoshuaikun on 2018/3/28.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "PersonTableViewController.h"
#import <BaseTool/ArchiveObject.h>

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
    ArchiveObject * archive = [[ArchiveObject alloc] init];
    archive.name = @"大美女";
    archive.age = 20;
    
    //准备路径:
    NSString *path = NSHomeDirectory();
    NSLog(@"%@",path);
    
    path = [path stringByAppendingPathComponent:@"singeGirl.txt"];
    //1:准备存储数据的对象
    NSMutableData *data = [NSMutableData data];
    //2:创建归档对象
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //3:开始归档
    [archiver encodeObject:archive forKey:@"person"];
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
    
    NSString * path = NSHomeDirectory();
    //准备解档路径
    NSData *myData = [NSData dataWithContentsOfFile:path];
    //创建反归档对象
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:myData];
    //反归档
    ArchiveObject *unArchiverObject = [ArchiveObject new];
    unArchiverObject = [unarchiver decodeObjectForKey:@"person"];
    //完成反归档
    [unarchiver finishDecoding];
    
    [self.mutableArray addObject:unArchiverObject];
    [self.tableView reloadData];
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
    ArchiveObject * archive = self.mutableArray[indexPath.row];
    cell.textLabel.text = archive.name;
    return cell;
}

#pragma mark - tableViweDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
