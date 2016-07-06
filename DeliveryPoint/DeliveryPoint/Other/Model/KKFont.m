//
//  KKFont.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKFont.h"

@interface KKFont()
/** 所有的 字体设置 **/
@property (nonatomic, strong) NSDictionary *allFonts;
@end

@implementation KKFont {
    // readonly对象重写get方法，需自己添加变量
    NSDictionary *_fontDict;
    KKFontSize _fontType;
}

- (NSDictionary *)allFonts {
    if(_allFonts == nil) {
        _allFonts = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Font" ofType:@"plist"]];;
    }
    return _allFonts;
}

- (KKFontSize)fontType {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *flag = [[NSUserDefaults standardUserDefaults] stringForKey:KKFontKey];
        if (flag.length == 0) {
            [self resetFont:[flag boolValue]];
        } else {
            _fontType = [flag boolValue];
        }
    });
    
    return _fontType;
}

- (NSDictionary *)fontDict {
    if (self.fontType == KKFontSizeMin) {
        _fontDict = self.allFonts[@"min"];
    } else if (self.fontType == KKFontSizeMiddle) {
        _fontDict = self.allFonts[@"middle"];
    } else {
        _fontDict = self.allFonts[@"max"];
    }
    
    return _fontDict;
}

+ (instancetype)shareFont {
    static KKFont *fontObj = nil;
    if (fontObj == nil) {
        fontObj = [[KKFont alloc] init];
    }
    
    return fontObj;
}

- (void)resetFont:(KKFontSize)fontType {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%zd", fontType] forKey:KKFontKey];
    _fontType = fontType;
    //    [self fontDict];
}




@end
