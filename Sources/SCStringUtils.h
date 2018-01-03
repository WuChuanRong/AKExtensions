//
//  SCStringUtils.h
//  AFNetworking
//
//  Created by sybl on 2017/12/8.
//

#import <Foundation/Foundation.h>

@interface SCStringUtils : NSObject

@end

@interface NSString (Utils)

/// 格式化字符串，3位一个，
+ (NSString *)strmethodComma:(NSString *)str;

/// 格式化字符串(number类型)，保留几个小数(最多5位，默认保留两位)
+ (NSString *)stringFormat:(id)obj DecimalCount:(NSInteger)decimalCount;

@end
