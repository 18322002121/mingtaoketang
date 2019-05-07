//
//  InformationClassAssistantHeaderView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InformationClassAssistantHeaderView : UICollectionReusableView
/** 资讯按钮回调 */
@property (nonatomic,strong) void (^informationButtonClickBlock)(UIButton *sender);
/** 开班按钮回调 */
@property (nonatomic,strong) void (^offerCourseButtonClickBlock)(UIButton *sender);
/** 助手按钮回调 */
@property (nonatomic,strong) void (^assistantButtonClickBlock)(UIButton *sender);
/** 资讯,开班,助手数组 */
@property (nonatomic,strong) NSMutableArray *informationClassAssistantArray;

@end

NS_ASSUME_NONNULL_END

