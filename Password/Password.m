//
//  Password.m
//  Password
//
//  Created by ZAREMYDREAM on 2017/12/15.
//  Copyright © 2017年 Devil. All rights reserved.
//

#import "Password.h"
@interface Password()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *pswTF;

@end

@implementation Password
#pragma mark - 懒加载
- (UITextField *)pswTF{
    if (!_pswTF) {
        _pswTF = [[UITextField alloc] init];
        
        _pswTF.delegate = self;
        
        _pswTF.keyboardType = UIKeyboardTypeNumberPad;
        
        //添加对输入值的监视
        [_pswTF addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _pswTF;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initUI];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

#pragma mark - 设置UI
- (void)initUI{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.pswTF];
    
    for (int i = 0; i < 6; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*self.frame.size.width/6.0, 0, self.frame.size.width/6.0, self.frame.size.height)];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.tag = 100 + i;
        
        [self addSubview:label];
    }
    
    //设置边框圆角与颜色
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10.0;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2;
}

//划线
- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2);
    
    //设置分割线颜色
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    
    CGContextBeginPath(context);
    
    for (int i = 0; i < 5;  i++){
        CGContextMoveToPoint(context, self.frame.size.width/6.0 * (i + 1), 0);
        CGContextAddLineToPoint(context,self.frame.size.width/6.0 * (i + 1) , self.frame.size.height);
    }
    
    CGContextStrokePath(context);
    
}

#pragma mark - 监视textField值
- (void)valueChange:(UITextField *)textField{
    NSString *text = textField.text;
    if (text.length <= 6){
        for (int i = 0; i < 6; i++) {
            UILabel *label = (UILabel *)[self viewWithTag:100 + i];
            
            if (i < text.length) {
                label.text = @"*";
            }
            else{
                label.text = @"";
            }
        }
    }
    else{
        textField.text = [text substringWithRange:NSMakeRange(0, 6)];
    }
    
    NSLog(@"%@",textField.text);
}

#pragma mark - 点击view开始输入
- (void)click{
    [self.pswTF becomeFirstResponder];
}

#pragma mark - 关闭键盘
- (void)closeKeyborad{
    [self.pswTF resignFirstResponder];
}
@end
