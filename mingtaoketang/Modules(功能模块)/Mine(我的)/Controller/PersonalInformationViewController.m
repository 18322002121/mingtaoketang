//
//  PersonalInformationViewController.m
//  mingtaoketang
//
//  Created by Linlin Ge on 2019/4/28.
//  Copyright © 2019年 hcy. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "PersonalInformationViewCell.h"
#import "HeadPortraitCell.h"
#import "PersonalInformationModel.h"
#import "ModifyNicknameViewController.h"

typedef NS_ENUM(NSUInteger, ShowSectionStatus) {
    ShowSectionStatusHeadPortrait = 0,    //头像cell
    ShowSectionStatusNickName,          //昵称
    ShowSectionStatusPhoneNumber,          //手机号
    ShowSectionStatusSex                   //性别
};

@interface PersonalInformationViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong)PublicTableView *tableView;
@property(nonatomic,strong)HeadPortraitCell *cell;
@property(nonatomic,strong)NSData *imageData;
@property(nonatomic,strong)UIImage *upImage;
/** 列表左侧标题 */
@property (nonatomic,strong) NSMutableArray *listTitlesArray;
/** 初始化模型数组 */
@property (nonatomic,strong) NSMutableArray *personalInformationArray;

@end

static NSString *const personalInformationViewCell =@"PersonalInformationViewCell";
static NSString *const headPortraitCell =@"HeadPortraitCell";

@implementation PersonalInformationViewController

- (NSMutableArray *)listTitlesArray{
    if (!_listTitlesArray) {
        _listTitlesArray = [NSMutableArray arrayWithObjects:@"头像",@"昵称",@"手机号码",@"性别", nil];
    }
    return _listTitlesArray;
}

- (NSMutableArray *)personalInformationArray{
    if (!_personalInformationArray) {
        _personalInformationArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _personalInformationArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.title = @"我的信息";
    [self reloadingRefresh];
}

- (void)reloadingRefresh{
    self.tableView.mj_header = [PublicRefreshHeader headerWithRefreshingBlock:^{
        //        [self.datas removeAllObjects];
        //        NSArray *datas = [self hn_modelArrayWithCategory:self.model.category fromModel:x];
        //        [self.datas addObjectsFromArray:datas];
        //        [self.tableView reloadData];
        [self networkRequest];
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)networkRequest{
    [HCYRequestManager app_user_detail_uid:([PublicUserDefaults valueForKey:@"user_id"] ? [PublicUserDefaults valueForKey:@"user_id"] : @"") success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict = responseObject;
        if (kDictIsEmpty(dict)) {
            
        }else{
            if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                [self.personalInformationArray removeAllObjects];
                PersonalInformationModel *model = [PersonalInformationModel yy_modelWithJSON:responseObject];
                [model.data enumerateObjectsUsingBlock:^(PersonalInformationData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    PersonalInformationData *dataModel = obj;
//                    self.user_money = dataModel.user_money;
//                    self.userName = dataModel.nickname;
                    if ([dataModel.sex isEqualToString:@"1"]) {
                        dataModel.sex = @"男";
                    }else if ([dataModel.sex isEqualToString:@"2"]){
                        dataModel.sex = @"女";
                    }
                    [self.personalInformationArray addObjectsFromArray:@[dataModel.avatar,dataModel.nickname,dataModel.mobile,dataModel.sex]];
                }];
                [self.tableView reloadData];
            }
        }
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
}

//- (void)setPersonalInformationArray:(NSMutableArray *)personalInformationArray{
//    _personalInformationArray = personalInformationArray;
//}



- (PublicTableView *)tableView{
    if (!_tableView) {
        _tableView = [[PublicTableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)style:(UITableViewStyleGrouped)];
        [_tableView registerClass:[PersonalInformationViewCell class] forCellReuseIdentifier:personalInformationViewCell];
        [_tableView registerClass:[HeadPortraitCell class] forCellReuseIdentifier:headPortraitCell];
        [self reloadTableviewDatasource:_tableView];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)reloadTableviewDatasource:(PublicTableView *)tableviews{
    tableviews.numberOfSectionsInTableViewBlock = ^NSInteger(UITableView * _Nonnull tableView) {
        return 1;
    };
    
    tableviews.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 4;
    };
    
    tableviews.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *normalCell = nil;
        
        if (indexPath.row == ShowSectionStatusHeadPortrait) {
            self.cell =[tableView dequeueReusableCellWithIdentifier:headPortraitCell forIndexPath:indexPath];
            normalCell = self.cell;
        }else{
            PersonalInformationViewCell *cell =[tableView dequeueReusableCellWithIdentifier:personalInformationViewCell forIndexPath:indexPath];
            [cell setLeftTitles:self.listTitlesArray[indexPath.row]];
            kArrayIsEmpty(self.personalInformationArray) ? : [cell setRightTitles:self.personalInformationArray[indexPath.row]];
            normalCell = cell;
        }
        
        return normalCell;
    };
    
    tableviews.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        if (indexPath.row == ShowSectionStatusHeadPortrait) {
            return 80;
        }else{
            return 57;
        }
    };
    
    tableviews.heightForHeaderInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 0.01;
    };
    
    tableviews.viewForHeaderInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
        return subView;
    };
    
    tableviews.heightForFooterInSectionBlock = ^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return 0.01;
    };
    
    tableviews.viewForFooterInSectionBlock = ^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
        return subView;
    };
    
    tableviews.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        if (indexPath.row == ShowSectionStatusHeadPortrait) {
            UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
            sheet.tag = 2550;
            //显示消息框
            [sheet showInView:self.view];
        }else if (indexPath.row == ShowSectionStatusNickName){
            ModifyNicknameViewController *modifyNicknameView = [[ModifyNicknameViewController alloc]init];
            modifyNicknameView.onClickedOKbtnBlock = ^(UIButton * _Nonnull sender) {
                [self networkRequest];
                !self.onClickedOKbtnBlock ? : self.onClickedOKbtnBlock(sender);
            };
            [self.navigationController pushViewController:modifyNicknameView animated:YES];
            
        }else if (indexPath.row == ShowSectionStatusPhoneNumber){
            
        }else if (indexPath.row == ShowSectionStatusSex){
//            [BRStringPickerView showStringPickerWithTitle:@"性别选择" dataSource:@[@"男", @"女"] defaultSelValue:nil isAutoSelect:YES themeColor:[UIColor redColor] resultBlock:^(id selectValue) {
//                [HCYRequestManager edit_sexUid:([PublicUserDefaults valueForKey:@"user_id"] ? [PublicUserDefaults valueForKey:@"user_id"] : @"") sex:selectValue success:^(id responseObject) {
//                    NSDictionary *dict = responseObject;
//                    if (kDictIsEmpty(dict)) {
//
//                    }else{
//                        if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
//                            [MBProgressHUD showMessag:dict[@"msg"] toView:self.view];
//                            [self networkRequest];
//                        }else{
//                            [MBProgressHUD showMessag:dict[@"msg"] toView:self.view];
//                        }
//                    }
//                } failure:^(NSError *errorMessage) {
//                    NSLog(@"%@",errorMessage);
//                }];
//            }];
            [BRStringPickerView showStringPickerWithTitle:@"性别选择" dataSource:@[@"男", @"女"] defaultSelValue:nil resultBlock:^(id selectValue) {
                [HCYRequestManager edit_sexUid:([PublicUserDefaults valueForKey:@"user_id"] ? [PublicUserDefaults valueForKey:@"user_id"] : @"") sex:selectValue success:^(id responseObject) {
                    NSDictionary *dict = responseObject;
                    if (kDictIsEmpty(dict)) {
                        
                    }else{
                        if ([[responseObject objectForKey:@"status"] integerValue] == 1) {
                            [MBProgressHUD showMessag:dict[@"msg"] toView:self.view];
                            [self networkRequest];
                        }else{
                            [MBProgressHUD showMessag:dict[@"msg"] toView:self.view];
                        }
                    }
                } failure:^(NSError *errorMessage) {
                    NSLog(@"%@",errorMessage);
                }];
            }];
        }
    };
    
}

#pragma mark -消息框代理实现-
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag == 2550) {
        NSUInteger sourceType = 0;
        // 判断系统是否支持相机
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePickerController.delegate = self; //设置代理
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = sourceType; //图片来源
            if (buttonIndex == 0) {
                return;
            }else if (buttonIndex == 1) {
                //拍照
                sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePickerController.sourceType = sourceType;
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }else if (buttonIndex == 2){
                //相册
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePickerController.sourceType = sourceType;
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }
        }else {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickerController.sourceType = sourceType;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
    _upImage = image;
    _imageData = UIImageJPEGRepresentation(image, 0.1);
    _cell.headPortraitImage.image = image;
    [self unloadImageRequest];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)unloadImageRequest {
    if (_imageData != nil) {
//        [HCYRequestManager appUid:@"33849" image:_imageData success:^(id responseObject) {
//            NSLog(@"%@",responseObject);
//        } failure:^(NSError *errorMessage) {
//            NSLog(@"%@",errorMessage);
//        }];
        
        NSLog(@"%@",_upImage);
        [HCYRequestManager appUid:@"33849" image:_upImage uploadData:_imageData success:^(id responseObject) {
            NSLog(@"%@",responseObject);
        } failure:^(NSError *errorMessage) {
            NSLog(@"%@",errorMessage);
        }];
    }
}

@end
