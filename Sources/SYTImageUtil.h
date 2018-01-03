//
//  SYTImageUtil.h
//  SYTTool
//
//  Created by soyute on 2017/10/2.
//  Copyright © 2017年 soyute. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SYTImageUtil : NSObject




+ (void)writeImageAtPath:(NSString *)path image:(UIImage *)image;
/**
 保存图片到默认的地址

 @param imageNew 图片数据
 @return 返回地址
 */
+(NSString *)writeImageAtDefaultPath:(UIImage*)imageNew;

+(CGFloat)getCompressionQuality:(UIImage *)image width:(CGFloat)width height:(CGFloat)height;

+(NSData *)compressionQuality:(UIImage *)image width:(CGFloat)width height:(CGFloat)height;

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;

+(UIImage*)getQrCdoeImage:(NSString*)str;

@end
