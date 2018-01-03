//
//  SCTextFieldUtils.h
//  AFNetworking
//
//  Created by sybl on 2017/12/27.
//

#import <Foundation/Foundation.h>

@interface SCTextFieldUtils : NSObject

@end

@interface UITextField (Utils)

/**
*  只能输入 数字和小数点(最多只能x有几位小数，默认2位)
*
*  @param range
*  @param string            当前输入的内容
*  @param numberCount       当前输入的内容
*
*  @return 输入是否正确
*/
- (BOOL)textFieldCheckInputNumberWithRange:(NSRange)range CurrentString:(NSString *)string DecimalNumberCount:(NSInteger)numberCount;

/**
 只能输入整数

 @param range <#range description#>
 @param string 当前输入的内容
 @return 输入是否正确
 */
- (BOOL)textFieldCheckInputNumberWithRange:(NSRange)range CurrentString:(NSString *)string;
@end
