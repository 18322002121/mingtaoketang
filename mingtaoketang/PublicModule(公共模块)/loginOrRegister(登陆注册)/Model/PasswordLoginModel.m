//
//  PasswordLoginModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PasswordLoginModel.h"

@implementation PasswordLoginData

@end
@implementation PasswordLoginModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [PasswordLoginData class]};
}
@end
