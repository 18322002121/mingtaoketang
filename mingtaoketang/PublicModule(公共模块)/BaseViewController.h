//
//  BaseViewController.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/25.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
/** 导航栏搜索框 */
- (BaseNavigationBar *)showCustomNavBar;

/** 异步并发请求 */
- (void)networkRequest;
@end

NS_ASSUME_NONNULL_END
