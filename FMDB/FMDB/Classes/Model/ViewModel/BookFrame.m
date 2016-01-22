

//
//  BookFrame.m
//  FMDB
//
//  Created by iOS on 16/1/22.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "BookFrame.h"
#import "BookResult.h"
#define SCREENW  [UIScreen mainScreen].bounds.size.width
@implementation BookFrame


- (void)setBook:(BookResult *)book{
    _book = book;
    
    [self setUpFrame];
}

- (void)setUpFrame{
    
    CGFloat coverX = 10;
    CGFloat coverY = 5;
    CGFloat coverW = 100;
    CGFloat coverH = 150;
    self.coverV = CGRectMake(coverX, coverY, coverW, coverH);
    
    CGFloat nameX = CGRectGetMaxX(_coverV)+10;
    CGFloat nameY = coverY;
    NSMutableDictionary *nameDict = [NSMutableDictionary dictionary];
    nameDict[NSFontAttributeName] = [UIFont systemFontOfSize:13.0];
    nameDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    CGSize nameSize = [_book.name sizeWithAttributes:nameDict];
    self.nameV = (CGRect){{nameX,nameY},nameSize};
    
    CGFloat authorX = nameX;
    CGFloat authorY = CGRectGetMaxY(_nameV)+10;
    NSMutableDictionary *authorDict = [NSMutableDictionary dictionary];
    authorDict[NSFontAttributeName] = [UIFont systemFontOfSize:13.0];
    authorDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    CGSize authorSize = [_book.author boundingRectWithSize:CGSizeMake(SCREENW-coverW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:authorDict context:nil].size;
    self.authorV = (CGRect){{authorX,authorY},authorSize};
    
    
    CGFloat chaptersX = nameX;
    CGFloat chaptersY = CGRectGetMaxY(_authorV)+10;
//    NSMutableDictionary *chapterDict = [NSMutableDictionary dictionary];
//    chapterDict[NSFontAttributeName] = [UIFont systemFontOfSize:13.0];
//    chapterDict[NSForegroundColorAttributeName] = [UIColor blackColor];
//    CGSize chapterSize = [_book.chapters boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:chapterDict context:nil].size;
    self.chaptersV =  CGRectMake(chaptersX, chaptersY, 100, 15);
//    self.chaptersV = (CGRect){{chaptersX,chaptersY},chapterSize};
    
    self.cellHeight = CGRectGetMaxY(_coverV)+5;

}

@end
