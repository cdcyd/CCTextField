//
//  CCTextField.h
//  CCTextField
//
//  Created by 佰道聚合 on 2017/9/11.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>

// 输入内容校验，通过 checkState 属性取出校验结果
typedef NS_ENUM(NSInteger, CCCheckType){
    CCCheckNone,            // 不做校验
    CCCheckAccount,         // 帐号(字母开头，允许字母数字下划线，长度在6~18之间)
    CCCheckPassword,        // 密码(以字母开头，只能包含字母、数字和下划线，长度在6~18之间)
    CCCheckStrongPassword,  // 强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在6-18之间)
    CCCheckEmail,           // 邮箱
    CCCheckZipCode,         // 邮编
    CCCheckDomain,          // 域名
    
    CCCheckPhone,           // 手机号
    CCCheckIDCard,          // 身份证(18位)
    CCCheckFloat,           // 浮点数(校验格式: "10"、"10.0")
    CCCheckDate,            // 日期(校验格式: "xxxx-xx-xx"、"xxxx-x-x")
    CCCheckMoney,           // 金额(校验格式: "10000.0"、"10,000.0"、"10000"、"10,000")
    CCCheckTel,             // 座机(校验格式: "xxx-xxxxxxx"、"xxxx-xxxxxxxx"、"xxx-xxxxxxx"、"xxx-xxxxxxxx"、"xxxxxxx"、"xxxxxxxx")
};

// 校验结果 空字符串(没有输入)、正常、不在字数限制范围内(输入超出限制)、不符合正则校验(输入不合法)
typedef NS_ENUM(NSInteger, CCCheckState){
    CCTextStateEmpty,
    CCTextStateNormal,
    CCTextStateNotInLimit,
    CCTextStateNotRegular,
};

@class CCTextField;
@protocol CCTextFieldDelegate <UITextFieldDelegate>

@optional
- (BOOL)textFieldShouldBeginEditing:(CCTextField *_Nonnull)textField;
- (void)textFieldDidBeginEditing:(CCTextField *_Nonnull)textField;
- (BOOL)textFieldShouldEndEditing:(CCTextField *_Nonnull)textField;
- (void)textFieldDidEndEditing:(CCTextField *_Nonnull)textField;
- (void)textFieldDidEndEditing:(CCTextField *_Nonnull)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0);

// 注意: 如果实现了该代理，checkState、minLimit、maxLimit、limit、check 等属性均会失效，此时，输入限制、输入校验都需要自己实现
- (BOOL)textField:(CCTextField *_Nonnull)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *_Nullable)string;

- (BOOL)textFieldShouldClear:(CCTextField *_Nonnull)textField;
- (BOOL)textFieldShouldReturn:(CCTextField *_Nonnull)textField;

@end

@interface CCTextField : UITextField

@property(nonatomic, nullable, weak) id<CCTextFieldDelegate> delegate;

@property(nonatomic, assign)NSInteger minLimit;

@property(nonatomic, assign)NSInteger maxLimit;

@property(nonatomic, assign)CCCheckType check;

@property(nonatomic, assign, readonly)CCCheckState checkState;

@end

