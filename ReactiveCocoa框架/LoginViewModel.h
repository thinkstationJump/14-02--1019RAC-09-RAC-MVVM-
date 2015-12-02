//
//  LoginViewModel.h
//  ReactiveCocoa框架
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 小码哥. All rights reserved.
//  处理登录界面的业务逻辑

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"
@interface LoginViewModel : NSObject

/** 账号 */
@property (nonatomic, strong) NSString *account;

// 密码
@property (nonatomic, strong) NSString *pwd;

// 提供登录按钮是否允许点击的信号
@property (nonatomic, strong, readonly) RACSignal *loginEnableSignal;

@property (nonatomic, strong, readonly) RACCommand *loginCommand;


@end
