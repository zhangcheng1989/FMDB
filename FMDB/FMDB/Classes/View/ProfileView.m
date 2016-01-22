

//
//  ProfileView.m
//  FMDB
//
//  Created by iOS on 16/1/22.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "ProfileView.h"
#import "BookFrame.h"
#import "BookResult.h"
#import "UIImageView+WebCache.h"
@interface ProfileView()
@property(nonatomic,weak)UIImageView *coverV;
@property(nonatomic,weak)UILabel *nameV;
@property(nonatomic,weak)UILabel *authorV;
@property(nonatomic,weak)UILabel *chaptersV;

@end

@implementation ProfileView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView{
    UIImageView *coverV = [UIImageView new];
    [self addSubview:coverV];
    self.coverV = coverV;
    
    UILabel *nameV = [UILabel new];
    nameV.font = [UIFont systemFontOfSize:13.0];
    nameV.textColor = [UIColor blackColor];
    [self addSubview:nameV];
    self.nameV = nameV;
    
    UILabel *authorV = [UILabel new];
    authorV.font = [UIFont systemFontOfSize:13.0];
    authorV.textColor = [UIColor blackColor];
    [self addSubview:authorV];
    self.authorV = authorV;
    
    
    UILabel *chapterV = [UILabel new];
    chapterV.font = [UIFont systemFontOfSize:13.0];
    chapterV.textColor = [UIColor blackColor];
    [self addSubview:chapterV];
    self.chaptersV = chapterV;
    
}

- (void)setBookFrame:(BookFrame *)bookFrame{
    _bookFrame = bookFrame;
    BookResult *book = bookFrame.book;
    
    self.coverV.frame = bookFrame.coverV;
    [self.coverV sd_setImageWithURL:book.cover];
    
    self.nameV.frame = bookFrame.nameV;
    self.nameV.text = book.name;
    
    self.authorV.frame = bookFrame.authorV;
    self.authorV.text = book.author;
    
    self.chaptersV.frame = bookFrame.chaptersV;
    

    if (book.finished == 0) {
        self.chaptersV.text = [NSString stringWithFormat:@"更新至%@章",book.chapters];
    }else{
        self.chaptersV.text = @"完本";
    }
    
}

@end