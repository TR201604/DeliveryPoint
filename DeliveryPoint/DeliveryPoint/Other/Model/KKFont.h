//
//  KKFont.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKFont : NSObject
/** 字体大小标识 **/
@property (nonatomic, assign, readonly) KKFontSize fontType;
/** 所有字体字典 **/
@property (nonatomic, strong, readonly) NSDictionary *fontDict;

/** 单例 **/
/** 返回Font.plist文件小或中或大字体的字典 **/
+ (instancetype)shareFont;

/** 修改沙盒的白天夜晚标识 **/
- (void)resetFont:(KKFontSize)fontType;
@end
