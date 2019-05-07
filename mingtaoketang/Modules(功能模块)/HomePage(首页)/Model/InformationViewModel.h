//
//  InformationViewModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InformationViewData :NSObject
@property (nonatomic , copy) NSString              * file_url;
@property (nonatomic , copy) NSString              * iid;
@property (nonatomic , copy) NSString              * add_time;
@property (nonatomic , copy) NSString              * title;

@end

@interface InformationViewModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<InformationViewData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
