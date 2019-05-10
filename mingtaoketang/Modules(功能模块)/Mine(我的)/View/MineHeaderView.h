//
//  MineHeaderView.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/26.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineHeaderView : UICollectionReusableView
@property (nonatomic,strong) void (^RechargeClickBlock)(UIButton *sender);
@property (nonatomic,strong) void (^SetTingClickBlock)(UIButton *sender);
@property (nonatomic,strong) void (^EducationalInstitutionsClickBlock)(UIButton *sender);
@property (nonatomic,strong) void (^PersonalInformationClickBlock)(UIButton *sender);

- (void)setUser_Money:(NSString *)userMoney userName:(NSString *)userName;

@end

NS_ASSUME_NONNULL_END
