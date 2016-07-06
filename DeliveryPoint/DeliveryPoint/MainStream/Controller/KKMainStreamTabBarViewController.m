//
//  KKMainStreamTabBarViewController.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMainStreamTabBarViewController.h"
#import "KKHomePageViewController.h"
#import "KKDiscoveryViewController.h"
#import "KKMeViewController.h"

@interface KKMainStreamTabBarViewController ()
/** tabBar图片颜色设置 **/
@property (nonatomic, strong) NSDictionary *tabImageColor;
/** tabBar字体大小设置 **/
@property (nonatomic, strong) NSDictionary *tabFonts;

@end

@implementation KKMainStreamTabBarViewController

- (NSDictionary *)tabImageColor {
    _tabImageColor = [KKImageColor shareImageColor].imageColors[KKMainStream][@"tabBar"];
    return _tabImageColor;
}

- (NSDictionary *)tabFonts {
    if(_tabFonts == nil) {
        _tabFonts = [KKFont shareFont].fontDict[KKMainStream][@"tabBar"];
    }
    return _tabFonts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setupTabBar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetImageColor) name:@"DelivertPointResetFont" object:nil];
}

- (void)resetImageColor {
    NSLog(@"%s", __func__);
}

- (void)setupTabBar {
    
    // 修改过tabBar的渲染颜色
    self.tabBar.tintColor = [UIColor kk_setRedBlueGreenAlphaColor:self.tabImageColor[@"tintColor"]];
    
    // 统一设置所有UITabBarItem属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont kk_setFontSize:self.tabFonts[@"barItem"]]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont kk_setFontSize:self.tabFonts[@"barItemSel"]]} forState:UIControlStateSelected];
    
    // 已添加UIView方式,修改tabbar的背景颜色
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.tag = 1001;
    [self.tabBar insertSubview:bgView atIndex:0];
    
    [self setupViewController:[[KKHomePageViewController alloc] init] navTitle:nil tabBarTitle:@"首页" image:self.tabImageColor[@"homePageItemImage"] selectedImage:self.tabImageColor[@"homePageItemImageClick"]];
    
    [self setupViewController:[[KKDiscoveryViewController alloc] init] navTitle:@"发现" tabBarTitle:@"发现" image:self.tabImageColor[@"disconverItemImage"]selectedImage:self.tabImageColor[@"disconverItemImageClick"]];
    
    [self setupViewController:[[KKMeViewController alloc] init] navTitle:@"我" tabBarTitle:@"我" image:self.tabImageColor[@"meItemImage"] selectedImage:self.tabImageColor[@"meItemImageClick"]];
    
    
}

- (void)setupViewController:(UIViewController *)viewController navTitle:(NSString *)navTitle tabBarTitle:(NSString *)tabBarTitle image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    viewController.navigationItem.title = navTitle;
    
    viewController.tabBarItem.title = tabBarTitle;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 导航啦
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self addChildViewController:nav];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
