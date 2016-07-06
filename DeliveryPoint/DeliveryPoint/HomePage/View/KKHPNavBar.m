//
//  KKHPNavBar.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPNavBar.h"

@implementation KKHPNavBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.barTintColor = [UIColor orangeColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(20, 18, 100, 20)];
        titleLabel.backgroundColor = [UIColor clearColor];
        [titleLabel setFont:[UIFont systemFontOfSize:20.0]];
        [titleLabel setText:@"新闻资讯"];
        [self addSubview:titleLabel];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(150, 18, 200, 25)];
        
        
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:view.frame];
        bgImageView.image = [UIImage imageNamed:@"play-voice-bg"];
        
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(170, 18, 180, 25)];
        textField.textColor = [UIColor blackColor];
        textField.placeholder = @"搜索";
        textField.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:textField];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imageView.image = [UIImage imageNamed:@"search"];
        [textField addSubview:imageView];
    }
    
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
