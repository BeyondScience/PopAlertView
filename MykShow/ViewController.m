//
//  ViewController.h
//  MykShow
//
//  Created by Li Peixin on 2018/9/17.
//  Copyright © 2018年 Li Peixin. All rights reserved.
//

#import "ViewController.h"
#import "MYKPopView.h"

@interface ViewController ()

@property (nonatomic, strong) MYKPopView *mykView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 44)];
    [btn addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    UITextField *txf = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 30, 10)];
    txf.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:txf];
}

-(void)showAlert:(UIButton *)sender{
    [self.mykView show];
    __weak typeof(self)weakself = self;
    [self.mykView setBtnClickHandel:^(NSUInteger index) {
        if (index == 0) {
            NSLog(@"====000");
        }else{
            NSLog(@"====111");
        }
        [weakself.mykView dismiss];
    }];
}

-(MYKPopView *)mykView{
    if (!_mykView) {
        _mykView = [[MYKPopView alloc] initWithFrame:[UIScreen mainScreen].bounds title:@"提示"];
    }
    return _mykView;
}


@end
