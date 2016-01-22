//
//  BookFrame.h
//  FMDB
//
//  Created by iOS on 16/1/22.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BookResult;
@interface BookFrame : NSObject
@property(nonatomic,strong)BookResult *book;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect coverV;
@property(nonatomic,assign)CGRect authorV;
@property(nonatomic,assign)CGRect chaptersV;
@property(nonatomic,assign)CGRect nameV;
@end
