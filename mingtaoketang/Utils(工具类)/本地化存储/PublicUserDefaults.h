//
//  PublicUserDefaults.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicUserDefaults : NSObject
+ (void)setObject:(id)value forKey:(NSString *)defaultName;
+ (id)objectForKey:(NSString *)defaultName;
+(void)setValue:(id)value forKey:(NSString *)defaultName;
+(id)valueForKey:(NSString *)defaultName;
+(void)removeObjectForKey:(NSString *)key;
+(void)clearAll;
@end

NS_ASSUME_NONNULL_END
