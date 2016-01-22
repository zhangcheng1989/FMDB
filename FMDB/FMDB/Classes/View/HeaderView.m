//
//  HeaderView.m
//  FMDB
//
//  Created by iOS on 16/1/21.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "HeaderView.h"
#import "BooksResult.h"
#import "Masonry.h"
@interface HeaderView()
@property(nonatomic,weak)UILabel *nameV;
@property(nonatomic,weak)UIButton *moreBtn;
@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (UILabel *)nameV{
    if (_nameV == nil) {
        UILabel *nameV =[UILabel new];
        nameV.font = [UIFont systemFontOfSize:14.0];
        nameV.textColor = [UIColor blackColor];
        [self addSubview:nameV];
        self.nameV = nameV;
    }
    return _nameV;
}

- (UIButton *)moreBtn{
    if (_moreBtn == nil) {
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [moreBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(didClickSelecteIndex:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:moreBtn];
        self.moreBtn = moreBtn;
    }
    return _moreBtn;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.nameV sizeToFit];
    [self.nameV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
}

- (void)setBooks:(BooksResult *)books{
    _books = books;
    self.nameV.text = books.name;
    self.moreBtn.tag = [books.ID integerValue];
}

- (void)didClickSelecteIndex:(UIButton *)moreBtn{
    if ([self.delegate respondsToSelector:@selector(headerViewClickSelecte:selIndex:title:)]) {
        [self.delegate headerViewClickSelecte:self selIndex:moreBtn.tag title:self.nameV.text];
    }
}

@end
