//
//  BaseTabBarController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomePageViewController.h"
#import "CurriculumViewController.h"
#import "LiveBroadcastViewController.h"
#import "MineViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVc];
    [self addTabarItems];
    [UITabBar appearance].translucent = NO;
}

#pragma mark-添加导航控制器
- (void)addChildVc{
    BaseNavigationController *one=[[BaseNavigationController alloc]initWithRootViewController:[[HomePageViewController alloc]init]];
    
    BaseNavigationController *two=[[BaseNavigationController alloc]initWithRootViewController:[[CurriculumViewController alloc]init]];
    
    //    BaseNavigationController *three=[[BaseNavigationController alloc]initWithRootViewController:[[InformationViewController alloc]init]];
    
    BaseNavigationController *three=[[BaseNavigationController alloc]initWithRootViewController:[[LiveBroadcastViewController alloc]init]];
    
    BaseNavigationController *four=[[BaseNavigationController alloc]initWithRootViewController:[[MineViewController alloc]init]];
    
    self.viewControllers=@[one,two,three,four];
}

- (void)addTabarItems
{
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"首页",
                                                 @"TabBarItemImage" : @"home1",
                                                 @"TabBarItemSelectedImage" : @"home2",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"课程",
                                                  @"TabBarItemImage" : @"subject1",
                                                  @"TabBarItemSelectedImage" : @"subject2",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"直播",
                                                 @"TabBarItemImage" : @"livebroadcast1",
                                                 @"TabBarItemSelectedImage" : @"livebroadcast2",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"我的",
                                                  @"TabBarItemImage" : @"mine1",
                                                  @"TabBarItemSelectedImage" : @"mine2"
                                                  };
    NSArray<NSDictionary *>  *tabBarItemsAttributes = @[    firstTabBarItemsAttributes,
                                                            secondTabBarItemsAttributes,
                                                            thirdTabBarItemsAttributes,
                                                            fourthTabBarItemsAttributes
                                                            ];
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.tabBarItem.title = tabBarItemsAttributes[idx][@"TabBarItemTitle"];
        obj.tabBarItem.image = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemImage"]];
        obj.tabBarItem.selectedImage = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemSelectedImage"]];
        obj.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    }];
    
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#AF1D36"];
}
@end
