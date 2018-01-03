//
//  SYTFileUtil.m
//  SYTTool
//
//  Created by soyute on 2017/10/2.
//  Copyright © 2017年 soyute. All rights reserved.
//

#import "SYTFileUtil.h"

@implementation SYTFileUtil

/*
 函数名称  ：queryHomePath
 函数描述  ：获取沙盒中Home路径
 输入参数  ：NULL
 输出参数  ：NULL
 返回值 ：Home路径
 */
+(NSString *)queryHomePath{
    NSString *homeDirectory =NSHomeDirectory();
    return [NSString stringWithFormat:@"%@",homeDirectory];
}
/*
 函数名称  ：queryDocumentPath
 函数描述  ：获取沙盒中document路径
 输入参数  ：NULL
 输出参数  ：NULL
 返回值 ：document路径
 */
+(NSString *)queryDocumentPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [NSString stringWithFormat:@"%@",documentsDirectory];
}
/*
 函数名称  ：queryDocumentAllSubPath
 函数描述  ：获取document下所有子路径
 输入参数  ：NULL
 输出参数  ：NULL
 返回值 ：document下所有子路径
 */
+(NSArray *)queryDocumentAllSubPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *filePaths = [fileManager subpathsOfDirectoryAtPath:documentsDirectory error:nil];
    return filePaths;
}
/*
 函数名称  ：queryCachePath
 函数描述  ：获取沙盒中cache路径
 输入参数  ：NULL
 输出参数  ：NULL
 返回值 ：cache路径
 */
+(NSString *)queryCachePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    return [NSString stringWithFormat:@"%@",cachesDirectory];
}
/*
 函数名称  ：queryLibraryPath
 函数描述  ：获取沙盒中library路径
 输入参数  ：NULL
 输出参数  ：NULL
 返回值 ：library路径
 */
+(NSString *)queryLibraryPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    return [NSString stringWithFormat:@"%@",libraryDirectory];
}
/*
 函数名称  ：queryTmpPath
 函数描述  ：获取沙盒中temp路径
 输入参数  ：NULL
 输出参数  ：NULL
 返回值 ：temp路径
 */
+(NSString *)queryTmpPath{
    NSString *tempDirectory = NSTemporaryDirectory();
    return [NSString stringWithFormat:@"%@",tempDirectory];
}
/*
 函数名称  ：createDirectorWith: Name:
 函数描述  ：创建文件目录
 输入参数  ：path:路径 ; directorName:文件目录名
 输出参数  ：NULL
 返回值 ：是否创建
 */
+(BOOL)createDirectorWith:(NSString *)path Name:(NSString *)directorName{
    if(!path)
        return NO;
    if([path isEqualToString:@""])
        return NO;
    if(!directorName)
        return NO;
    if([directorName isEqualToString:@""])
        return NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath=[path stringByAppendingPathComponent:directorName];
    if(!filePath)
        return NO;
    if([filePath isEqualToString:@""])
        return NO;
    BOOL isCreate=[fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    return isCreate;
}
/*
 函数名称  ：delFileWith: fileName:
 函数描述  ：删除文件
 输入参数  ：path:文件部分路径 ; fileName:文件名
 输出参数  ：NULL
 返回值 ：是否删除
 */
+(BOOL)delFileWith:(NSString *)path fileName:(NSString *)fileName{
    if(!path)
        return NO;
    if([path isEqualToString:@""])
        return NO;
    if(!fileName)
        return NO;
    if([fileName isEqualToString:@""])
        return NO;
    NSString *filePath=[path stringByAppendingPathComponent:fileName];
    if(!filePath)
        return NO;
    if([filePath isEqualToString:@""])
        return NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error=nil;
    BOOL isDel=[fileManager removeItemAtPath:filePath error:&error];
    return isDel;
}
/*
 函数名称  ：delFileWithPath:
 函数描述  ：删除文件
 输入参数  ：filePath:文件路径
 输出参数  ：NULL
 返回值 ：是否删除
 */
+(BOOL)delFileWithPath:(NSString *)filePath{
    if(!filePath)
        return NO;
    if([filePath isEqualToString:@""])
        return NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error=nil;
    BOOL isDel=[fileManager removeItemAtPath:filePath error:&error];
    return isDel;
}


+(NSString*)createImageName {
    return [self createFileNameWithSuffix:@"png"];
}

+(NSString*)createFileNameWithSuffix:(NSString*)suffix {
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    //    NSString *timeString = [NSString stringWithFormat:@"%ld", (long)a];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    //    NSString *timeString = [NSString stringWithFormat:@"%ld", timeD];
    timeString = [timeString stringByReplacingOccurrencesOfString:@"." withString:@""];
    //    NSLog(@"------------->timeString=%@", timeString);
    return [NSString stringWithFormat:@"layer_file_%@.%@",timeString, suffix];
}


+(NSString*)createFileName:(NSString*)suffix {
    if ([suffix length] <= 0) {
        suffix = @"";
    }
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    //    long timeD = a * 1000000;
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    //    NSString *timeString = [NSString stringWithFormat:@"%ld", timeD];
    //    NSLog(@"------------->timeString=%@", timeString);
    timeString = [timeString stringByReplacingOccurrencesOfString:@"." withString:@""];
    return [NSString stringWithFormat:@"layer_file_%@_%@", suffix,timeString];
}

+(NSString*)createVideoName {
    return [self createFileNameWithSuffix:@"mp4"];
}


+(NSString*)createImagePath {
    return [self createFilePath:@"png"];
}

+(NSString*)createVideoPath {
    return [self createFilePath:@"mp4"];
}

+(NSString*)createFilePath:(NSString*)suffix {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //    NSString *localFilePath = [[documentsDirectory stringByAppendingPathComponent:[self createFileName:suffix]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *localFilePath = [[[documentsDirectory stringByAppendingPathComponent:[self createFileName:suffix]]
                                stringByAppendingPathExtension:suffix]
                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return localFilePath;
}



+(NSString*)createFilePathWidthFileName:(NSString*)fileName suffix:(NSString*)suffix{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *localFilePath = [[[documentsDirectory stringByAppendingPathComponent:fileName]
                                stringByAppendingPathExtension:suffix]
                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return localFilePath;
}

@end
