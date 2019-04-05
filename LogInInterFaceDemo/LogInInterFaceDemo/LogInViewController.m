//
//  LogInViewController.m
//  LogInInterFaceDemo
//
//  Created by caoshuaikun on 2018/3/22.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "LogInViewController.h" 
#import <Masonry.h>
#import <WebKit/WebKit.h>
#import <BaseTool/SKBaseTool.h>
#import <BaseTool/BaseTool.h>
#import <BaseTool/UIView+Category.h>

@interface LogInViewController () <WKUIDelegate>

@property (nonatomic, strong) UIImageView * headImageView;//头ImageView
@property (nonatomic, strong) UILabel * titleLabel;//头标签
@property (nonatomic, strong) UIButton * getButton;

@end

@implementation LogInViewController

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"SK LogIn Demo";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:34.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor greenColor];
        [_titleLabel sizeToFit];
        _titleLabel.center = CGPointMake(self.view.sk_centerX,
                                         CGRectGetMaxY(self.headImageView.frame) + 40);
        
    }
    return _titleLabel;
}
- (UIImageView *)headImageView {
    if (!_headImageView) {
        
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width / 2 - 50, 80, 100, 100)];
        _headImageView.image = [SKBaseTool imageWithRoundCorner:[UIImage imageNamed:@"headImage"] cornerRadius:50 size:CGSizeMake(100, 100)];
    }
    return _headImageView;
}
- (UIButton *)getButton {
    if (!_getButton) {
        _getButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getButton setTitle:@"Get" forState:UIControlStateNormal];
        [_getButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _getButton.backgroundColor = UIColorWithRGB(156, 197, 251, 1.0);
        _getButton.frame = CGRectMake(Screen_Width / 2 - 87.5, Screen_Height - 200, 175, 40);
        [SKBaseTool viewClipCorners:_getButton cornerRadSize:CGSizeMake(175, 40)];//切圆角
        [_getButton addTarget:self action:@selector(buttonGetAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BG_COLOR;
    [self.view addSubview:self.headImageView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.getButton];
}

//点击get按钮
- (void)buttonGetAction {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
