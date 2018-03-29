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

@end

@implementation LogInViewController

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.center = CGPointMake(self.view.sk_centerX,
//                                         CGRectGetMaxY(self.headImageView.frame) + 20);
        _titleLabel.sk_centerX = self.view.sk_centerX;
        _titleLabel.sk_y = CGRectGetMaxY(self.headImageView.frame) + 20;
        _titleLabel.text = @"SK LogIn Demo";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:34.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor greenColor];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}
- (UIImageView *)headImageView {
    if (!_headImageView) {
        
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width / 2 - 50,
                                                                       80,
                                                                       100,
                                                                       100)];
        _headImageView.image = [SKBaseTool imageWithRoundCorner:[UIImage imageNamed:@"headImage"] cornerRadius:50 size:CGSizeMake(100, 100)];
    }
    return _headImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BG_COLOR;
    [self.view addSubview:self.headImageView];
    [self.view addSubview:self.titleLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
