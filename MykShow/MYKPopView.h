//
//  MYKPopView.h
//  TanChuang
//
//  Created by Li Peixin on 2018/9/11.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectIndexBlock)(NSUInteger index);

@interface MYKPopView : UIWindow

@property (nonatomic, copy) SelectIndexBlock btnClickHandel;

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;

-(void)show;
-(void)dismiss;

@end
