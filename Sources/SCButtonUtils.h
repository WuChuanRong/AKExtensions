//
//  SCButtonUtils.h
//  AFNetworking
//
//  Created by soyute on 2017/12/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@interface SCButtonUtils : NSObject

@end


@interface UIButton (Utils)

/**
 *  增大按钮的点击范围
 *
 *  @param top    上
 *  @param right  右
 *  @param bottom 下
 *  @param left   左
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top Right:(CGFloat)right Bottom:(CGFloat) bottom Left:(CGFloat)left;


@end



