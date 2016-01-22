//
//  ProfileCell.h
//  FMDB
//
//  Created by iOS on 16/1/22.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BookFrame;
@interface ProfileCell : UITableViewCell


+ (instancetype)profileWithTableView:(UITableView *)tableView;

@property(nonatomic,strong)BookFrame *bookFrame;

@end
