//
//  LoginViewModel.m
//  ReactiveCocoa框架
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel


- (instancetype)init
{
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    
    // 设置按钮是否允许点击的信号
    _loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self, account),RACObserve(self, pwd)] reduce:^id(NSString *account,NSString *pwd){
        
        return @(account.length && pwd.length);
    }];
    
    // 处理点击登录按钮的业务逻辑
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        // 命令执行就会调用
        // 处理事件
        
        // AFN
        NSLog(@"发送请求");
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"请求数据"];
            return nil;
        }];
    }];

}

@end
