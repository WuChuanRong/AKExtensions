//
//  SCDateUtils.h
//  AFNetworking
//
//  Created by sybl on 2017/12/11.
//

#import <Foundation/Foundation.h>

@interface SCDateUtils : NSObject

@end

@interface NSDate(Utils)

/**
 *  日期NSDate 转 字符串
 *
 *  @param date       日期NSDate
 *  @param format     时间字符串的格式，如 yyyy-MM-dd HH:mm:ss（默认）
 *
 *  @return 时间字符串
 */
+ (NSString *)dateChangeToTimeStringWithDate:(NSDate *)date Format:(NSString *)format;

/**
  *  时间戳 转 字符串
  *
  *  @param timeSp     时间戳
  *  @param format     时间字符串的格式，如 yyyy-MM-dd HH:mm:ss（默认）
  *
  *  @return 时间字符串
  */
+ (NSString *)dateChangeToTimeStringWithTimeSp:(NSTimeInterval)timeSp Format:(NSString *)format;
/**
 *  时间字符串根据特定的格式转换为时间戳
 *
 *  @param dateString 时间字符串
 *  @param format     时间字符串的格式，如 yyyy-MM-dd HH:mm:ss（默认）
 *
 *  @return 时间戳
 */
+ (NSTimeInterval)dateGetTimeSpWithDateString:(NSString *)dateString Format:(NSString *)format;

/**
 *  获取当前的时间戳
 *
 *  @return 时间戳
 */
+ (NSTimeInterval)dateGetCurrentTimeSp;

@end
