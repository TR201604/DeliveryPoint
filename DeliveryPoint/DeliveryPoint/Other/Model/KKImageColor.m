//
//  KKImageColor.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKImageColor.h"

@interface KKImageColor()
/** 所有的 图片和颜色文件设置 **/
@property (nonatomic, strong) NSDictionary *allImageColors;
@end


@implementation KKImageColor {
    // readonly对象重写get方法，需自己添加变量
    NSDictionary *_imageColors;
    BOOL _isDay;
}

- (NSDictionary *)allImageColors {
    if(_allImageColors == nil) {
        _allImageColors = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ImageColor" ofType:@"plist"]];;
    }
    return _allImageColors;
}

- (BOOL)isDay {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *flag = [[NSUserDefaults standardUserDefaults] stringForKey:KKDayOrNightSettingKey];
        if (flag.length == 0) {
            [self resetImageColor:YES];
        } else {
            _isDay = [flag boolValue];
        }
    });
    
    return _isDay;
}

- (NSDictionary *)imageColors {
    if (self.isDay) {
        _imageColors = self.allImageColors[@"day"];
    } else {
        _imageColors = self.allImageColors[@"night"];
    }
    
    return _imageColors;
}

+ (instancetype)shareImageColor {
    static KKImageColor *imageColor = nil;
    if (imageColor == nil) {
        imageColor = [[KKImageColor alloc] init];
    }
    
    return imageColor;
}

- (void)resetImageColor:(BOOL)isDay {
    NSLog(@"%@", isDay?@"1":@"0");
    [[NSUserDefaults standardUserDefaults] setObject:isDay?@"1":@"0" forKey:KKDayOrNightSettingKey];
    _isDay = isDay;
}

@end
