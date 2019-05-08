//
//  AppDelegate+BootPage.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/8.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "AppDelegate+BootPage.h"
#import "DHGuidePageHUD.h"

@implementation AppDelegate (BootPage)
- (void)reloadGuidePage{
    // 设置APP引导页
    if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        //        self.tabBarController.tabBar.hidden=YES;
        // 静态引导页
        [self setStaticGuidePage];
        
        // 动态引导页
        // [self setDynamicGuidePage];
        
        // 视频引导页
        // [self setVideoGuidePage];
    }
    
    // 设置该控制器背景图片
    UIImageView *bg_imageView = [[UIImageView alloc] initWithFrame:self.window.frame];
    [bg_imageView setImage:[UIImage imageNamed:@"view_bg_image"]];
    [self.window addSubview:bg_imageView];
}

- (void)setStaticGuidePage {
    NSArray *imageNameArray = @[@"guideImage1",@"guideImage2",@"guideImage3"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.window.frame imageNameArray:imageNameArray buttonIsHidden:NO];
    guidePage.slideInto = YES;
    //    [self.navigationController.view addSubview:guidePage];
    [self.window addSubview:guidePage];
}


@end
