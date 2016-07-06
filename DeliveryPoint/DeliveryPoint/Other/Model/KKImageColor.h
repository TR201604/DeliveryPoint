//
//  KKImageColor.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKImageColor : NSObject

/** 白天或夜晚设置 **/
@property (nonatomic, assign, readonly) BOOL isDay;
/** 图像和颜色数组 **/
@property (nonatomic, strong, readonly) NSDictionary *imageColors;

/** 单例 **/
/** 返回imageColor.plist文件day或ning的字典 **/
+ (instancetype)shareImageColor;

/** 修改沙盒的白天夜晚标识 **/
- (void)resetImageColor:(BOOL)isDay;

@end
