//
//  CustomImageView.m
//  TheCoreAnimationDemo
//
//  Created by caoshuaikun on 2018/3/15.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "CustomImageView.h"
#import "Header_Custom.h"
#define View_Width self.frame.size.width
#define View_Height self.frame.size.height

@implementation CustomImageView

- (UIImageView *)bottomLeftImageView {
    if (!_bottomLeftImageView) {
        _bottomLeftImageView = [self customImageViewRect:CGRectMake(20, self.frame.size.height - 140, (Screen_Width - 60) / 2.0, 120) imageName:@"xingchi.zhou"];
    }
    return _bottomLeftImageView;
}
- (UIImageView *)bottomRightImageView {
    if (!_bottomRightImageView) {
        _bottomRightImageView = [self customImageViewRect:CGRectMake(View_Width - 20 - (Screen_Width - 60) / 2.0, self.frame.size.height - 140, (Screen_Width - 60) / 2.0, 120) imageName:@"wu.jincheng"];
    }
    return _bottomRightImageView;
}
- (UIImageView *)centerImageView {
    if (!_centerImageView) {
        _centerImageView = [self customImageViewRect:CGRectMake(20, self.frame.size.height - 160 - 170, View_Width - 40, 170) imageName:@"yuanyuan.gao"];
    }
    return _centerImageView;
}

- (UIImageView *)customImageViewRect:(CGRect)rect imageName:(NSString *)imageName {
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleToFill;
    return imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(85, 173, 143, 1.0);
        [self addSubview:self.bottomLeftImageView];
        [self addSubview:self.bottomRightImageView];
        [self addSubview:self.centerImageView];
    }
    return self;
}

@end
