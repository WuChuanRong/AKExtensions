//
//  SYTImageUtil.m
//  SYTTool
//
//  Created by soyute on 2017/10/2.
//  Copyright © 2017年 soyute. All rights reserved.
//

#import "SYTImageUtil.h"
#import "SYTFileUtil.h"

@implementation SYTImageUtil


+ (void)writeImageAtPath:(NSString *)path image:(UIImage *)image {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    CGFloat compressionQuality = [self getCompressionQuality:image width:600 height:600];
    [fileManager createFileAtPath:path contents:UIImageJPEGRepresentation(image, compressionQuality) attributes:nil];
}

+(NSString *)writeImageAtDefaultPath:(UIImage*)image {
    
//
//    UIImageOrientation imageOrientation = imageNew.imageOrientation;
//    if (imageOrientation != UIImageOrientationUp) {
//        UIGraphicsBeginImageContext(imageNew.size);
//        [imageNew drawInRect:CGRectMake(0, 0, imageNew.size.width, imageNew.size.height)];
//        imageNew = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//    }
//    
//    NSData *webData = [self compressionQuality:imageNew width:600 height:600];
//    if (webData) {
//        imageLocalPath = [SYTFileUtil createImagePath];
//        [webData writeToFile:imageLocalPath atomically:YES];
//    }
    
    NSString *path = [SYTFileUtil createImagePath];
    [self writeImageAtPath:path image:image];
    return path;
}

+(CGFloat)getCompressionQuality:(UIImage *)image width:(CGFloat)width height:(CGFloat)height {
    
    CGFloat scale = width / image.size.width;
    CGFloat scale1 = height / image.size.height;
    if (scale > scale1) {
        scale = scale1;
    }
    if (scale > 1) {
        scale = 1;
    }
    return scale;
}


+(NSData *)compressionQuality:(UIImage *)image width:(CGFloat)width height:(CGFloat)height {
    return UIImageJPEGRepresentation(image, [self getCompressionQuality:image width:width height:height]);
}


+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    
    
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;

    UIGraphicsBeginImageContext(targetSize);

    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage ;
}

+(UIImage*)getQrCdoeImage:(NSString*)str {
    // 1. 实例化二维码滤镜
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2. 恢复滤镜的默认属性
    
    [filter setDefaults];
    
    // 3. 将字符串转换成
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4. 通过KVO设置滤镜inputMessage数据
    
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5. 获得滤镜输出的图像
    
    CIImage *outputImage = [filter outputImage];
    
    // 6. 将CIImage转换成UIImage，并放大显示
    
    return [UIImage imageWithCIImage:outputImage scale:100.0 orientation:UIImageOrientationUp];
}


@end
