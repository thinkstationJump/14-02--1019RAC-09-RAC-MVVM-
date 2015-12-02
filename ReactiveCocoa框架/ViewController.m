//
//  ViewController.m
//  ReactiveCocoa框架
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

#import "ReactiveCocoa.h"

#import "LoginViewModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@property (nonatomic, strong) LoginViewModel *loginViewModel;

@end

@implementation ViewController

- (LoginViewModel *)loginViewModel
{
    if (_loginViewModel == nil) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    
    return _loginViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // MVVM:每个控制器定义一个VM模型,这个模型专门处理这个控制器中的业务逻辑
    
    // VM:处理业务逻辑

    // V:控制器,描述控件展示到哪个地方
    
    // 监听登录按钮点击
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        // 点击登录按钮
        
        // 执行命令
        [self.loginViewModel.loginCommand execute:nil];
        
    }];
    
}

// 绑定视图模型属性
- (void)bindViewModel
{
    // 绑定账号属性
    RAC(self.loginViewModel,account) = _accountField.rac_textSignal;
    // 绑定密码属性
    RAC(self.loginViewModel,pwd) = _pwdField.rac_textSignal;
    
    // 处理登录按钮能否点击的业务逻辑
    RAC(_loginBtn, enabled) = self.loginViewModel.loginEnableSignal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
