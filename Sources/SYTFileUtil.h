//
//  SYTFileUtil.h
//  SYTTool
//
//  Created by soyute on 2017/10/2.
//  Copyright © 2017年 soyute. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYTFileUtil : NSObject
//获取沙盒中Home路径
+(NSString *)queryHomePath;
//获取沙盒中document路径
+(NSString *)queryDocumentPath;
//获取document下所有子路径
+(NSArray *)queryDocumentAllSubPath;
//获取沙盒中cache路径
+(NSString *)queryCachePath;
//获取沙盒中library路径
+(NSString *)queryLibraryPath;
//获取沙盒中temp路径
+(NSString *)queryTmpPath;
//创建文件目录-根据路径和文件目录名
+(BOOL)createDirectorWith:(NSString *)path Name:(NSString *)directorName;
//删除文件-根据文件部分路径和文件名
+(BOOL)delFileWith:(NSString *)path fileName:(NSString *)fileName;
//删除文件-根据文件路径
+(BOOL)delFileWithPath:(NSString *)filePath;


+(NSString*)createImageName;

+(NSString*)createVideoName;

+(NSString*)createFileName:(NSString*)suffix;

+(NSString*)createFileNameWithSuffix:(NSString*)suffix;

+(NSString*)createImagePath;

+(NSString*)createVideoPath;

+(NSString*)createFilePath:(NSString*)suffix;


+(NSString*)createFilePathWidthFileName:(NSString*)fileName suffix:(NSString*)suffix;

@end
