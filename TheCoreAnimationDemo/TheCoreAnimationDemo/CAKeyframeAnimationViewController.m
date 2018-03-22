//
//  CAKeyframeAnimationViewController.m
//  TheCoreAnimationDemo
//
//  Created by caoshuaikun on 2018/3/15.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"
#import "CustomImageView.h"
#import "Header_Custom.h"

@interface CAKeyframeAnimationViewController ()

@property (nonatomic, strong) CustomImageView * customImageView;
@property (nonatomic, strong) NSArray * buttonArray;
@property (nonatomic, assign) BOOL whethAction;

@end

@implementation CAKeyframeAnimationViewController

- (CustomImageView *)customImageView {
    if (!_customImageView) {
        _customImageView = [[CustomImageView alloc] initWithFrame:CGRectMake(0, Screen_Hgight - 400, Screen_Width, 400)];
    }
    return _customImageView;
}
- (NSArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = @[@"按照线路进行移动",@"绕园"];
    }
    return _buttonArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatAnimationButton];
}

- (void)creatAnimationButton {
    for (int i = 0; i < self.buttonArray.count; i++) {
        UIButton * button = [[UIButton alloc] init];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(animationAction:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(20 * (i + 1) + (Screen_Width - 80) * i / 3.0,
                                  20 * (self.buttonArray.count / 3 + 1) + 44 * (i/3 + 1) + 20,
                                  (Screen_Width - 80) / 3.0,
                                  44);
        button.backgroundColor = RGBA(41, 124, 248, 1.0);
        [button setTitle:self.buttonArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
}

- (void)animationAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
//            [self chengeMyCenter];
            break;
        case 101:
//            [self flipImageView];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

@end
