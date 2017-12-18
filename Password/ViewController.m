//
//  ViewController.m
//  Password
//
//  Created by ZAREMYDREAM on 2017/12/15.
//  Copyright © 2017年 Devil. All rights reserved.
//

#import "ViewController.h"
#import "Password.h"

@interface ViewController ()

@property(strong,nonatomic)Password *psw;

@end

@implementation ViewController
#pragma mark - 懒加载
-(Password *)psw{
    if (!_psw) {
        _psw = [[Password alloc] initWithFrame:CGRectMake(50, 50, 300, 50)];
    }
    
    return _psw;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.psw];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.psw closeKeyborad];
}


@end
