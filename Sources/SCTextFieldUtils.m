//
//  SCTextFieldUtils.m
//  AFNetworking
//
//  Created by sybl on 2017/12/27.
//

#import "SCTextFieldUtils.h"

@implementation SCTextFieldUtils

@end

@implementation UITextField (Utils)

- (BOOL)textFieldCheckInputNumberWithRange:(NSRange)range CurrentString:(NSString *)string DecimalNumberCount:(NSInteger)numberCount {
    BOOL isHaveDian = YES;
    if ([self.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    }
    if ([string length] > 0) {
        //当前输入的字符
        unichar single = [string characterAtIndex:0];
        if ((single >= '0' && single <= '9') || single == '.') {
            // 数据格式正确
            // 首字母不能为0和小数点
            if([self.text length] == 0){
                if(single == '.') {
                    // showTip 第一个数字不能为小数点
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            // 小数点前面只能有一个0，不能连续输入多个0
            if ([self.text length] == 1) {
                unichar first = [self.text characterAtIndex:0];
                if (single == '0' && first == '0') {
                    // showTip 只能有一个0开头
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            // 输入的字符是否是小数点
            if (single == '.') {
                if(!isHaveDian) {
                    // text中还没有小数点
                    isHaveDian = YES;
                    return YES;

                }else{
                    // showTip 您已经输入过小数点了
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }else{
                if (isHaveDian) {
                    // 存在小数点
                    // 判断小数点的位数
                    // 最多输入numberCount位小数
                    if (numberCount <= 0) {
                        numberCount = 0;
                    }
                    NSRange ran = [self.text rangeOfString:@"."];
                    if (range.location - ran.location <= numberCount) {
                        return YES;
                    }else {

                        return NO;
                    }
                }else {
                    return YES;
                }
            }
        }else {
            // showTip 输入的数据格式不正确
            [self.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else {
        return YES;
    }
}

- (BOOL)textFieldCheckInputNumberWithRange:(NSRange)range CurrentString:(NSString *)string {
    // 首字母不能为0
    if (range.length == 0 && range.location == 0 && [string isEqual: @"0"]) {
        return NO;
    }
    NSString *number = @"1234567890";
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:number] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basic = [string isEqualToString:filtered];
    return basic;
}

@end
