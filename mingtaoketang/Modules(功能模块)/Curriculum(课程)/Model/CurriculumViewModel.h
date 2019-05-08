//
//  CurriculumViewModel.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/7.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurriculumViewChildren :NSObject
@property (nonatomic , copy) NSString              * cat_name;
@property (nonatomic , copy) NSString              * cat_id;
@property (nonatomic , copy) NSString              * cat_icon;

@end

@interface CurriculumViewData :NSObject
@property (nonatomic , copy) NSArray<CurriculumViewChildren *>              * children;
@property (nonatomic , copy) NSString              * cat_id;
@property (nonatomic , copy) NSString              * cat_name;

@end

@interface CurriculumViewModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , copy) NSArray<CurriculumViewData *>              * data;
@property (nonatomic , copy) NSString              * status;

@end

NS_ASSUME_NONNULL_END
