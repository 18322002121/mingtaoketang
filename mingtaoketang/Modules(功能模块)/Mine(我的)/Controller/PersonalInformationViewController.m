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

typedef NS_ENUM(NSUInteger, ShowSectionStatus) {
    ShowSectionStatusHeadPortrait = 0,    //头像cell
    ShowSectionStatusNormal          //正常cell
};

@interface PersonalInformationViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong)PublicTableView *tableView;
@property(nonatomic,strong)HeadPortraitCell *cell;
@property(nonatomic,strong)NSData *imageData;
@property(nonatomic,strong)UIImage *upImage;
@end

static NSString *const personalInformationViewCell =@"PersonalInformationViewCell";
static NSString *const headPortraitCell =@"HeadPortraitCell";

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.title = @"我的信息";
}

- (void)networkRequest{
    [HCYRequestManager app_user_detail_uid:([PublicUserDefaults valueForKey:@"user_id"] ? [PublicUserDefaults valueForKey:@"user_id"] : @"") success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
}

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
