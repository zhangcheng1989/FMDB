//
//  ProfileCell.m
//  FMDB
//
//  Created by iOS on 16/1/22.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "ProfileCell.h"
#import "ProfileView.h"
@interface ProfileCell()
@property(nonatomic,weak)ProfileView *profileView;
@end

@implementation ProfileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView{
    ProfileView *profile = [[ProfileView alloc]init];
    [self.contentView addSubview:profile];
    self.profileView = profile;
}


+ (instancetype)profileWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell";
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:ID];
    }
    return cell;
}

- (void)setBookFrame:(BookFrame *)bookFrame{
    _bookFrame = bookFrame;
    self.profileView.bookFrame = bookFrame;
}

@end
