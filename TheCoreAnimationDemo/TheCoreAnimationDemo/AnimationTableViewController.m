//
//  AnimationTableViewController.m
//  TheCoreAnimationDemo
//
//  Created by caoshuaikun on 2018/3/15.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "AnimationTableViewController.h"
#import "CABasicAnimationViewController.h"
#import "CAKeyframeAnimationViewController.h"
#import "CATransitionViewController.h"
#import "CAAnimationGroupViewController.h"
#import "CASpringAnimationViewController.h"

@interface AnimationTableViewController ()

@property (nonatomic, strong) NSArray * animationArray;

@end

@implementation AnimationTableViewController

- (NSArray *)animationArray {
    if (!_animationArray) {
        _animationArray = @[@"CABasicAnimation",//基本动画
                            @"CAKeyframeAnimation",//
                            @"CATransition",//转场动画
                            @"CAAnimationGroup",//动画组
                            @"CASpringAnimation"];//弹性动画
    }
    return _animationArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animationArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            CABasicAnimationViewController * baseAnimationController = [[CABasicAnimationViewController alloc] init];
            baseAnimationController.title = self.animationArray[0];
            [self.navigationController pushViewController:baseAnimationController animated:YES];
        }
            break;
        case 1:
        {
            CAKeyframeAnimationViewController * keyAnimationController = [[CAKeyframeAnimationViewController alloc] init];
            keyAnimationController.title = self.animationArray[1];
            [self.navigationController pushViewController:keyAnimationController animated:YES];
        }
            break;
        case 2:
        {
            CATransitionViewController * transitionController = [[CATransitionViewController alloc] init];
            transitionController.title = self.animationArray[2];
            [self.navigationController pushViewController:transitionController animated:YES];
        }
            break;
        case 3:
        {
            CAAnimationGroupViewController * groupAnimationController = [[CAAnimationGroupViewController alloc] init];
            groupAnimationController.title = self.animationArray[3];
            [self.navigationController pushViewController:groupAnimationController animated:YES];
        }
            break;
        case 4:
        {
            CASpringAnimationViewController * springAnimationController = [[CASpringAnimationViewController alloc] init];
            springAnimationController.title = self.animationArray[4];
            [self.navigationController pushViewController:springAnimationController animated:YES];
        }
            break;
    }
}


@end
