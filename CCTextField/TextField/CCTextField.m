//
//  CCTextField.m
//  CCTextField
//
//  Created by 佰道聚合 on 2017/9/11.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "CCTextField.h"

@implementation NSString (CCValidate)

#pragma mark - 输入限制
// 数字
- (BOOL)isNumber
{
    NSString *tmpRegex = @"^[0-9]+$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 字母
- (BOOL)isLetter
{
    NSString *tmpRegex = @"^[A-Za-z]+$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 中文
- (BOOL)isCHZN
{
    NSString *tmpRegex = @"^[\\u4e00-\\u9fa5]+$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 标点符号
- (BOOL)isPunctuation
{
    NSString *tmpRegex = @"^[[:punct:]]+$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 特殊字符(键盘上所有可见的特殊字符，包括标点符号)
- (BOOL)isSpecialCharacter
{
    NSString *tmpRegex = @"((?=[\x21-\x7e]+)[^A-Za-z0-9])+$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 空格
- (BOOL)isSpace
{
    return [self isEqualToString:@" "];
}

// -
- (BOOL)isMinusSign
{
    return [self isEqualToString:@"-"];
}

// ,
- (BOOL)isComma
{
    return [self isEqualToString:@","];
}

// .
- (BOOL)isAnend
{
    return [self isEqualToString:@"."];
}

#pragma mark - 输入校验
// 帐号
- (BOOL)isAccount
{
    NSString *tmpRegex = @"^[a-zA-Z][a-zA-Z0-9_]{6,18}$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 密码
- (BOOL)isPassword
{
    NSString *tmpRegex = @"^[a-zA-Z]\\w{6,18}$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 强密码
- (BOOL)isStrongPassword
{
    NSString *tmpRegex = @"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,18}$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 邮箱
- (BOOL)isEmail
{
    NSString *tmpRegex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 邮编
- (BOOL)isZipCode
{
    NSString *tmpRegex = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 域名
- (BOOL)isDomain
{
    NSString *reg = @"[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?";
    NSPredicate *regextestmm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
    return [regextestmm evaluateWithObject:self];
}

// 浮点数
- (BOOL)isFloat{
    NSString *tmpRegex = @"^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 日期
- (BOOL)isDate
{
    NSString *tmpRegex = @"\\d{4}-(0?[1-9]|1[0-2])-((0?[1-9])|((1|2)[0-9])|30|31)";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 电话
- (BOOL)isTel
{
    NSString *tmpRegex = @"^((\\(\\d{2,3}\\))|(\\d{3}\\-))?(\\(0\\d{2,3}\\)|0\\d{2,3}-)?[1-9]\\d{6,7}(\\-\\d{1,4})?$";
    NSPredicate *tmpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", tmpRegex];
    return [tmpTest evaluateWithObject:self];
}

// 手机
- (BOOL)isPhone
{
    if (self.length != 11){ return NO; }
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *regextestmm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmm evaluateWithObject:self];
}

// 身份证
- (BOOL)isIDCard
{
    if (self.length != 18){ return NO; }
    NSString *reg = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)";
    NSPredicate *regextestmm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
    return [regextestmm evaluateWithObject:self];
}

// 金额
- (BOOL)isMoney
{
    NSString *reg = @"^([0-9]+|[0-9]{1,3}(,[0-9]{3})*)(.[0-9]{1,2})?$";
    NSPredicate *regextestmm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
    return [regextestmm evaluateWithObject:self];
}

@end

// 输入限制
typedef NS_ENUM(NSInteger, CCLimitType){
    CCLimitNone             = 0,       // 全字符
    CCLimitCHZN             = 1 << 0,  // 只能输入中文(用户在输入中文时，比先输入字母，所有如果仅有该限制，是什么也输不进去的)
    CCLimitLetter           = 1 << 1,  // 只能输入字母(用户在输入中文时，会先输入字母，该限制只有在英文输入时才有效，如果用中文输入，还是可以输入中文的)
    CCLimitNumber           = 1 << 2,  // 只能输入数字
    CCLimitPunctuation      = 1 << 3,  // 只能输入标点
    CCLimitSpecialCharacter = 1 << 4,  // 只能输入特殊字符(键盘上所有可见的特殊字符，包括标点符号)
    
    CCLimitSpaces           = 1 << 5,  // 只能输入空格 ' '
    CCLimitComma            = 1 << 6,  // 只能输入逗号 ','
    CCLimitAnend            = 1 << 7,  // 只能输入句号 '.'
    CCLimitMinusSign        = 1 << 8,  // 只能输入负号 '-'
};

@interface CCTextField()<UITextFieldDelegate>

@property(nonatomic, assign, readwrite)CCCheckState checkState;

@property(nonatomic, assign, readwrite)CCLimitType limit;

@end

@implementation CCTextField
@synthesize delegate = _delegate;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        super.delegate = self;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textDidChanged:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillChanged:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
    }
    return self;
}

-(void)setCheck:(CCCheckType)check
{
    _check = check;
    
    if (check == CCCheckFloat) {
        // 浮点数 只能输入 数字、小数点
        self.limit = CCLimitNumber | CCLimitAnend;
    }
    else if (check == CCCheckIDCard) {
        // 身份证 只能输入 数字、字母、最大18位
        self.limit = CCLimitNumber | CCLimitLetter;
        self.maxLimit = 18;
    }
    else if (check == CCCheckTel) {
        // 电话 只能输入 数字、-
        self.limit = CCLimitNumber | CCLimitMinusSign;
    }
    else if (check == CCCheckDate) {
        // 日期 只能输入 数字、-
        self.limit = CCLimitNumber | CCLimitMinusSign;
    }
    else if (check == CCCheckMoney) {
        // 金额 只能输入 数字、小数点、逗号
        self.limit = CCLimitNumber | CCLimitComma | CCLimitAnend;
    }
    else if (check == CCCheckPhone) {
        // 手机 只能输入 数字、最大11位
        self.limit = CCLimitNumber;
        self.maxLimit = 11;
    }
}

-(void)setMinLimit:(NSInteger)minLimit
{
    _minLimit = minLimit;
    _maxLimit = _maxLimit > minLimit ? _maxLimit : minLimit;
}

#pragma mark - delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([_delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [_delegate textFieldDidBeginEditing:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([_delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [_delegate textFieldDidEndEditing:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{
    if ([_delegate respondsToSelector:@selector(textFieldDidEndEditing:reason:)]) {
        [_delegate textFieldDidEndEditing:self reason:reason];
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([_delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [_delegate textFieldShouldBeginEditing:self];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([_delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [_delegate textFieldShouldEndEditing:self];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if ([_delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [_delegate textFieldShouldClear:self];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([_delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [_delegate textFieldShouldReturn:self];
    }
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [_delegate textField:self shouldChangeCharactersInRange:range replacementString:string];
    }
    return [self shouldChangeRange:range replacementString:string];
}

#pragma mark - notification
-(void)textDidChanged:(NSNotification *)notify{
    // 空字符串
    if (self.text.length <= 0) {
        self.checkState = CCTextStateEmpty;
        return ;
    }
    // 超出限制范围
    if (self.maxLimit > 0 && (self.text.length < self.minLimit || self.text.length > self.maxLimit)) {
        self.checkState = CCTextStateNotInLimit;
        return ;
    }
    // 正则校验
    if ((self.check == CCCheckTel   && ![self.text isTel])   ||
        (self.check == CCCheckDate  && ![self.text isDate])  ||
        (self.check == CCCheckEmail && ![self.text isEmail]) ||
        (self.check == CCCheckFloat && ![self.text isFloat]) ||
        (self.check == CCCheckMoney && ![self.text isMoney]) ||
        (self.check == CCCheckPhone && ![self.text isPhone]) ||
        (self.check == CCCheckDomain    && ![self.text isDomain])  ||
        (self.check == CCCheckIDCard    && ![self.text isIDCard])  ||
        (self.check == CCCheckAccount   && ![self.text isAccount]) ||
        (self.check == CCCheckZipCode   && ![self.text isZipCode]) ||
        (self.check == CCCheckPassword  && ![self.text isPassword])||
        (self.check == CCCheckStrongPassword && ![self.text isStrongPassword])){
        self.checkState = CCTextStateNotRegular;
        return ;
    }
    self.checkState = CCTextStateNormal;
}

#pragma mark - private
-(BOOL)shouldChangeRange:(NSRange)range replacementString:(NSString *)string
{
    // 1.允许回车，不然return健收不了键盘：允许空字符串，不然删除健删除不了
    if ([string isEqualToString:@"\n"] || [string isEqualToString:@""]){
        return YES;
    }
    
    // 2.检查是否超过最大值
    NSString *text = [self.text stringByReplacingCharactersInRange:range withString:string];
    if (self.maxLimit > 0 && text.length > self.maxLimit) {
        return NO;
    }
    
    // 3.检查输入类型
    if ((self.limit | CCLimitNone) == CCLimitNone) {
        return YES;
    }
    if ((self.limit & CCLimitCHZN) == CCLimitCHZN) {
        if ([string isCHZN]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitLetter) == CCLimitLetter) {
        if ([string isLetter]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitNumber) == CCLimitNumber) {
        if ([string isNumber]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitPunctuation) == CCLimitPunctuation) {
        if ([string isPunctuation]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitSpecialCharacter) == CCLimitSpecialCharacter) {
        if ([string isSpecialCharacter]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitSpaces) == CCLimitSpaces) {
        if ([string isSpace]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitComma) == CCLimitComma) {
        if ([string isComma]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitAnend) == CCLimitAnend) {
        if ([string isAnend]) {
            return YES;
        }
    }
    if ((self.limit & CCLimitMinusSign) == CCLimitMinusSign) {
        if ([string isMinusSign]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Keyboard
-(void)keyboardWillChanged:(NSNotification *)notify{
    UIWindow *window = [self window];
    if (!window || !self.isFirstResponder) return ;
    
    NSDictionary *dic = [notify userInfo];
    id rect = [dic objectForKey:UIKeyboardFrameEndUserInfoKey];
    id option = [dic objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    id duration = [dic objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    CGRect frame = [self.superview convertRect:self.frame toView:window];
    CGFloat minY = CGRectGetMinY([rect CGRectValue]);
    CGFloat maxY = CGRectGetMaxY(frame);
    
    // 偏移量
    CGFloat offsetY = minY - maxY;
    // 动画时间
    NSTimeInterval durationValue = [duration floatValue];
    // 动画加速度
    UIViewAnimationOptions optionValue = [option integerValue];
    // 执行动画的view
    UIView *animationView = [self viewController].view;
    if (!animationView) animationView = window;
    
    if (minY >= CGRectGetMaxY(window.frame)) {
        [UIView animateWithDuration:durationValue delay:0.0 options:optionValue animations:^{
            animationView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }
    else if (offsetY < 0){
        [UIView animateWithDuration:durationValue delay:0.0 options:optionValue animations:^{
            animationView.transform = CGAffineTransformTranslate(animationView.transform, 0, offsetY);
        } completion:nil];
    }
}

- (UIViewController *)viewController
{
    if ([[self nextResponder] isKindOfClass:[UIViewController class]]) {
        return (UIViewController *)[self nextResponder];
    }
    
    for (UIView* next = [self superview]; next; next = next.superview){
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]){
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
