//
//  LiveBroadcastCourseShowCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/6.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LiveBroadcastCourseShowData;
NS_ASSUME_NONNULL_BEGIN

@interface LiveBroadcastCourseShowCell : UICollectionViewCell
/** 初始化模型 */
@property (nonatomic,strong) LiveBroadcastCourseShowData *liveBroadcastModel;
@end

NS_ASSUME_NONNULL_END
