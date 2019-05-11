//
//  ModifyNicknameViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/5/10.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "ModifyNicknameViewController.h"

@interface ModifyNicknameViewController ()
/** 背景视图 */
@property (nonatomic,strong) UIView *backView;
/** 修改昵称输入框 */
@property (nonatomic,strong) PublicTextfield *changeNickNameTextfield;
/** 修改昵称 */
@property (nonatomic,strong) NSString *changeNickNames;
@end

@implementation ModifyNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改昵称";
    [self addRightBtn];
    _backView = [[UIView alloc]init];
    _backView.layer.cornerRadius = 25;
    _backView.layer.borderWidth = 1;
    _backView.layer.borderColor = [UIColor colorWithHexString:@"#EEEEEE"].CGColor;
    [self.view addSubview:_backView];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-30);
        make.top.mas_equalTo(self.view.mas_top).offset(43);
        make.height.mas_offset(@50);
    }];
    
    _changeNickNameTextfield = [PublicTextfield textFieldBackground:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"" clearsOnBeginEditing:YES];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"修改昵称" attributes:
                                             @{NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                               NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}
                                             ];
    _changeNickNameTextfield.attributedPlaceholder = attrString;
    _changeNickNameTextfield.borderStyle = UITextBorderStyleNone;
    [_changeNickNameTextfield addTarget:self action:@selector(changeNickNameTextfieldClick:) forControlEvents:UIControlEventEditingChanged];
    [self.backView addSubview:_changeNickNameTextfield];
    [_changeNickNameTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.backView.mas_left).offset(15);
        make.right.mas_equalTo(self.backView.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.backView.mas_centerY).offset(0);
        make.height.mas_offset(@50);
    }];
}

- (void)changeNickNameTextfieldClick:(UITextField *)sender{
    _changeNickNames = sender.text;
}

- (void)addRightBtn {
    UIButton *completeButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [completeButton setTitle:@"完成" forState:UIControlStateNormal];
    [completeButton setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    completeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    completeButton.backgroundColor = [UIColor colorWithHexString:@"#1B80F1"];
    completeButton.layer.cornerRadius = 10;
    [completeButton addTarget:self action:@selector(onClickedOKbtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:completeButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    [completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];

}

- (void)onClickedOKbtn:(UIButton *)sender{
    [HCYRequestManager app_edit_nicknameUid:([PublicUserDefaults valueForKey:@"user_id"] ? [PublicUserDefaults valueForKey:@"user_id"] : @"") nickname:self.changeNickNames success:^(id responseObject) {
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.navigationController popViewControllerAnimated:YES];
                [MBProgressHUD showMessag:dict[@"msg"] toView:self.view];
                !self.onClickedOKbtnBlock ? : self.onClickedOKbtnBlock(sender);
            }else{
                [MBProgressHUD showMessag:dict[@"msg"] toView:self.view];
            }
        }
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
}

@end
