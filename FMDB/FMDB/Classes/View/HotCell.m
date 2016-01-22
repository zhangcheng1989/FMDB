

//
//  HotCell.m
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "HotCell.h"
#import "BookResult.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
@interface HotCell()
@property(nonatomic,weak)UIImageView *imageV;
@property(nonatomic,weak)UILabel *titleV;
@property(nonatomic,weak)UILabel *chaptersV;
@end

@implementation HotCell


- (UIImageView *)imageV{
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc]init];
        [self.contentView addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}

- (UILabel *)titleV{
    if (_titleV == nil) {
        UILabel *titleV = [UILabel new];
        titleV.textColor = [UIColor blackColor];
        titleV.font = [UIFont systemFontOfSize:13.0];
        [self.contentView addSubview:titleV];
        _titleV = titleV;
    }
    return _titleV;
}

- (UILabel *)chaptersV{
    if (_chaptersV == nil) {
        UILabel *chaptersV = [UILabel new];
        chaptersV.textColor = [UIColor whiteColor];
        chaptersV.font = [UIFont systemFontOfSize:13.0];
        chaptersV.alpha = 0.5;
        chaptersV.textAlignment = NSTextAlignmentCenter;
        chaptersV.backgroundColor = [UIColor blackColor];
        [self.imageV addSubview:chaptersV];
        self.chaptersV = chaptersV;
    }
    return _chaptersV;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, self.frame.size.height));
    }];
    
    
    [self.titleV sizeToFit];
    [self.titleV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imageV).offset(20);
        make.centerX.equalTo(self);
    }];
    
    [self.chaptersV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.imageV.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 25));
    }];
    
}

- (void)setBook:(BookResult *)book{
    _book = book;
    
    [self.imageV sd_setImageWithURL:book.cover];
    
    self.titleV.text = book.name;
    
    if (book.finished == 0) {
        self.chaptersV.text = [NSString stringWithFormat:@"更新至%@章",book.chapters];
    }else{
        self.chaptersV.text = @"完本";
    }
    
}

@end
