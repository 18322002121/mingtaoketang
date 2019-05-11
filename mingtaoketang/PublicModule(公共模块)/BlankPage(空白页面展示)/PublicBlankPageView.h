//
//  PublicBlankPageView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/11.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicBlankPageView : UIView
/** 空白页需要显示内容 */
- (void)reloadBlankPageView:(NSString *)showTitle;
@end

NS_ASSUME_NONNULL_END
