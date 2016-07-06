//
//  KKHomePageViewController.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHomePageViewController.h"
#import "KKHPNavBar.h"
#import <DKNightVersion.h>

@interface KKHomePageViewController ()

@end

@implementation KKHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KKGlobalbgColor;
    //self.view.dk_backgroundColorPicker = DKColorPickerWithRGB(0xffffff, 0x343434, 0xfafafa);
    self.view.dk_backgroundColorPicker = DKColorPickerWithColors([UIColor redColor], [UIColor greenColor], [UIColor blueColor]);
    
    // 设置导航栏
    [self setupNav];
}

- (void)setupNav {
    [self.navigationController setValue:[[KKHPNavBar alloc] init] forKey:@"navigationBar"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (arc4random_uniform(2)) {
        
        [self.dk_manager nightFalling];
    } else {
        [self.dk_manager dawnComing];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
