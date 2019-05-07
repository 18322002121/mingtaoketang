//
//  InformationClassAssistantModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InformationClassAssistantData :NSObject
@property (nonatomic , copy) NSString              * cat_id;
@property (nonatomic , copy) NSString              * keywords;

@end

@interface InformationClassAssistantModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<InformationClassAssistantData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
