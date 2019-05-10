//
//  PersonalInformationModel.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PersonalInformationModel.h"

@implementation PersonalInformationData

@end
@implementation PersonalInformationModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [PersonalInformationData class]};
}
@end
