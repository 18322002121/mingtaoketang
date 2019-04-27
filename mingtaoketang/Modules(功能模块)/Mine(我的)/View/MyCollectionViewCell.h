//
//  MyCollectionViewCell.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/27.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectionViewCell : UITableViewCell
@property (nonatomic,strong) void (^CancelCollectionClickBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
