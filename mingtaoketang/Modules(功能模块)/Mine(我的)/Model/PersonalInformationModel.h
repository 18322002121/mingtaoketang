//
//  PersonalInformationModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalInformationData :NSObject
@property (nonatomic , copy) NSString              * Token;
@property (nonatomic , copy) NSString              * mobile;
@property (nonatomic , copy) NSString              * avatar;
@property (nonatomic , copy) NSString              * campus_name;
@property (nonatomic , copy) NSString              * nickname;
@property (nonatomic , copy) NSString              * user_money;
@property (nonatomic , copy) NSString              * user_id;
@property (nonatomic , copy) NSString              * sex;

@end

@interface PersonalInformationModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<PersonalInformationData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
