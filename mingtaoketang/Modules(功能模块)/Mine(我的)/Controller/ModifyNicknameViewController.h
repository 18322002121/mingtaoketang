//
//  ModifyNicknameViewController.h
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModifyNicknameViewController : BaseViewController
/** 修改昵称回调按钮 */
@property (nonatomic,strong) void (^onClickedOKbtnBlock)(UIButton *sender);
@end

NS_ASSUME_NONNULL_END
