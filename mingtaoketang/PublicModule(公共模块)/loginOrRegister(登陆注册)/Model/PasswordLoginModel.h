//
//  PasswordLoginModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PasswordLoginData :NSObject
@property (nonatomic , copy) NSString              * Token;
@property (nonatomic , copy) NSString              * user_id;

@end

@interface PasswordLoginModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , strong) PasswordLoginData              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
