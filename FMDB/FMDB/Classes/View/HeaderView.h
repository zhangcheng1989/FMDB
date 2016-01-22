//
//  HeaderView.h
//  FMDB
//
//  Created by iOS on 16/1/21.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BooksResult,HeaderView;

@protocol HeaderViewDelegate <NSObject>

- (void)headerViewClickSelecte:(HeaderView *)headerView selIndex:(NSInteger)selIndex title:(NSString *)title;

@end

@interface HeaderView : UICollectionReusableView

@property(nonatomic,strong)BooksResult *books;

@property(nonatomic,weak)id<HeaderViewDelegate> delegate;

@end
