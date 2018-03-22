//
//  CABasicAnimationViewController.m
//  TheCoreAnimationDemo
//
//  Created by caoshuaikun on 2018/3/15.
//  Copyright © 2018年 useeinfo. All rights reserved.
//

#import "CABasicAnimationViewController.h"
#import "CustomImageView.h"
#import "Header_Custom.h"
#import <Masonry.h>

@interface CABasicAnimationViewController () <CAAnimationDelegate>

@property (nonatomic, strong) CustomImageView * customImageView;
@property (nonatomic, strong) NSArray * buttonArray;
@property (nonatomic, assign) BOOL whethAction;

@end

@implementation CABasicAnimationViewController

- (CustomImageView *)customImageView {
    if (!_customImageView) {
        _customImageView = [[CustomImageView alloc] initWithFrame:CGRectMake(0, Screen_Hgight - 400, Screen_Width, 400)];
    }
    return _customImageView;
}
- (NSArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = @[@"更改位置",@"按照圆心旋转",@"按照中心线旋转"];
    }
    return _buttonArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.customImageView];
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
            [self chengeMyCenter];
            break;
        case 101:
            [self flipImageView];
            break;
    }
}

//移动位置
- (void)chengeMyCenter {
    
    [self.customImageView bringSubviewToFront:self.customImageView.bottomLeftImageView];
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.delegate = self;
    ani.fromValue = [NSValue valueWithCGPoint:self.customImageView.bottomLeftImageView.center];
    ani.toValue = [NSValue valueWithCGPoint:self.customImageView.centerImageView.center];
    ani.removedOnCompletion = NO;//动画完成之后是否回到原位置
    ani.repeatCount = 1;//重复次数
    ani.duration = 3;//动画时间
    ani.fillMode = kCAFillModeRemoved;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [ani setValue:[NSValue valueWithCGPoint:CGPointMake(20, 20)] forKey:@"PostionAni"];
    [self.customImageView.bottomLeftImageView.layer addAnimation:ani forKey:@"PostionAni"];
}

//翻转view
- (void)flipImageView {
    
    self.whethAction = !self.whethAction;
    if (self.whethAction) {
        [self animationStart:self.customImageView.centerImageView.layer];
    } else {
        [self animationPause:self.customImageView.centerImageView.layer];
        //[self.customImageView.centerImageView.layer removeAnimationForKey:@"tansform"];
        return;
    }
    
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    ani.delegate = self;
    ani.byValue = [NSNumber numberWithFloat:M_PI_2 * 4];
    ani.removedOnCompletion = NO;
    ani.duration = 2.0;
    ani.autoreverses = NO;//旋转之后是否旋转到原来的位置
    ani.speed = 1.0;
    ani.repeatCount = HUGE_VALF;//设置无限循环
    [self.customImageView.centerImageView.layer addAnimation:ani forKey:@"tansform"];
}

//暂停动画
- (void)animationPause:(CALayer *)layer {
    CFTimeInterval interval = [layer convertTime:CACurrentMediaTime() toLayer:nil];
    layer.timeOffset = interval;
    layer.speed = 0;
}
//动画开始
- (void)animationStart:(CALayer *)layer {
    CFTimeInterval interval = CACurrentMediaTime() - layer.timeOffset;
    layer.timeOffset = 0;
    layer.beginTime = interval;
    layer.speed = 1.0;
}

- (void)animationDidStart:(CAAnimation *)anim {
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    [self.customImageView.layer removeAllAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
