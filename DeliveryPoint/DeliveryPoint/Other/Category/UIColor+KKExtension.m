//
//  UIColor+KKExtension.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UIColor+KKExtension.h"

@implementation UIColor (KKExtension)
+ (instancetype)kk_setRedBlueGreenAlphaColor:(NSString *)redBlueGreenAlpha {
    NSArray *all = [redBlueGreenAlpha componentsSeparatedByString:@","];
    if (all.count != 4) {
        all = [redBlueGreenAlpha componentsSeparatedByString:@"，"];
    }
    if (all.count != 4) {
        NSLog(@"error:color params is illegal");
        return nil;
    }
    
    CGFloat red = [all[0] doubleValue];
    CGFloat green = [all[1] doubleValue];
    CGFloat blue = [all[2] doubleValue];
    CGFloat alpha = [all[3] doubleValue];
    
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:alpha];
}
@end
