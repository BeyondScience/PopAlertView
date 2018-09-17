//
//  MYKPopView.m
//  TanChuang
//
//  Created by Li Peixin on 2018/9/11.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "MYKPopView.h"

@implementation MYKPopView

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        [self setupUIWithTitle:title];
    }
    return self;
}

-(void)setupUIWithTitle:(NSString *)title{
    self.windowLevel = UIWindowLevelNormal;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    
    //背景
    UIView *backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    backView.userInteractionEnabled = YES;
    [backView addGestureRecognizer:tap];
    [self addSubview:backView];
    
    //弹窗背景图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    imageView.frame = CGRectMake(0, 0, 280, 120);
    imageView.center = CGPointMake(self.center.x, self.center.y);
    imageView.layer.cornerRadius = 3;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:imageView];

    
    //弹窗标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 280, 40)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:label];

    //选项按钮
    NSArray *titleArray = @[@"取消", @"确定"];
    NSArray <UIColor *>*colorArray = @[[UIColor grayColor], [UIColor redColor]];
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(40 + 120 * i, 70, 80, 30)];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.backgroundColor = colorArray[i];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:btn];
    }
}

-(void)show{
    //让当前UIWindow变成keyWindow，并显示出来
    [self makeKeyAndVisible];
}

-(void)dismiss{
    self.hidden = YES;
    [self resignKeyWindow];
    [self removeFromSuperview];
}

-(void)btnOnClick:(UIButton *)sender{
    if (self.btnClickHandel) {
        self.btnClickHandel(sender.tag);
    }
}
@end
