//
//  SCStringUtils.m
//  AFNetworking
//
//  Created by sybl on 2017/12/8.
//

#import "SCStringUtils.h"

@implementation SCStringUtils

@end


@implementation NSString (Utils)

+ (NSString *)strmethodComma:(NSString *)str {

    NSString *intStr;
    NSString *floStr;
    // [self rangeOfString:string].location != NSNotFound
    if ([str rangeOfString:@"."].location != NSNotFound) {
        NSRange range = [str rangeOfString:@"."];
        floStr = [str substringFromIndex:range.location];
        intStr = [str substringToIndex:range.location];
    }else{
        floStr = @"";
        intStr = str;
    }

    if (intStr.length <=3) {
        return [intStr stringByAppendingString:floStr];
    }else {

        NSInteger length = intStr.length;
        NSInteger count = length/3;
        NSInteger y = length%3;

        NSString *tit = [intStr substringToIndex:y] ;

        NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];

        for (int i =0; i < count; i ++) {
            NSInteger index = i + i *3;
            [det insertString:@","atIndex:index];
        }
        if (y ==0) {
            det = [[det substringFromIndex:1]mutableCopy];
        }

        intStr = [tit stringByAppendingString:det];
        return [intStr stringByAppendingString:floStr];
    }
}

+ (NSString *)stringFormat:(id)obj DecimalCount:(NSInteger)decimalCount {

    NSString *string = [NSString stringWithFormat:@"%@",obj];
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:string];
    
    double value = [number doubleValue];

    switch (decimalCount) {
        case 1:
            string = [NSString stringWithFormat:@"%.1f",value];
            break;
        case 2:
            string = [NSString stringWithFormat:@"%.2f",value];
            break;
        case 3:
            string = [NSString stringWithFormat:@"%.3f",value];
            break;
        case 4:
            string = [NSString stringWithFormat:@"%.4f",value];
            break;
        case 5:
            string = [NSString stringWithFormat:@"%.5f",value];
            break;

        default:
            string = [NSString stringWithFormat:@"%.2f",value];
            break;
    }


    return [[NSDecimalNumber decimalNumberWithString:string] stringValue];
}

@end
