//
//  SCDateUtils.m
//  AFNetworking
//
//  Created by sybl on 2017/12/11.
//

#import "SCDateUtils.h"

#define kFormatter @"yyyy-MM-dd HH:mm:ss"

@implementation SCDateUtils

@end

@implementation NSDate(Utils)

+ (NSString *)dateChangeToTimeStringWithDate:(NSDate *)date Format:(NSString *)format {

    if (!date) {
        date = [NSDate new];
    }

    NSDateFormatter *g_dayDateFormatter = [[NSDateFormatter alloc] init];
    if (format.length == 0) {
        format = kFormatter;
    }
    [g_dayDateFormatter setDateFormat:format];

    NSString *timeStr = [g_dayDateFormatter stringFromDate:date];

    return timeStr;
}

+ (NSString *)dateChangeToTimeStringWithTimeSp:(NSTimeInterval)timeSp Format:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeSp/1000];
    NSDateFormatter *g_dayDateFormatter = [[NSDateFormatter alloc] init];
    if (format.length == 0) {
        format = kFormatter;
    }
    [g_dayDateFormatter setDateFormat:format];
    NSString *timeStr = [g_dayDateFormatter stringFromDate:date];
    return timeStr;
}

+ (NSTimeInterval)dateGetTimeSpWithDateString:(NSString *)dateString Format:(NSString *)format {

    NSTimeInterval time = 0;

    NSDateFormatter *g_dayDateFormatter = [[NSDateFormatter alloc] init];
    if (format.length == 0) {
        format = kFormatter;
    }
    [g_dayDateFormatter setDateFormat:format];

    NSDate *fromdate=[g_dayDateFormatter dateFromString:dateString];
    time= (NSTimeInterval)([fromdate timeIntervalSince1970] * 1000);
    
    return time;
}
+ (NSTimeInterval)dateGetCurrentTimeSp {
    //获取系统当前的时间戳
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timeSp = [dat timeIntervalSince1970] * 1000;
    return timeSp;
}
@end
