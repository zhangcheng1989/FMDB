//
//  MainViewController.m
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MainViewController.h"
#import "HotTool.h"
#import "BookResult.h"
#import "BooksResult.h"
#import "HotCell.h"
#import "HeaderView.h"
#import "MoreViewController.h"
#import "MBProgressHUD+HUD.h"
@interface MainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,HeaderViewDelegate>
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,weak)UICollectionView *collectionView;
@end

static NSString *ID = @"cell";

static NSString *head = @"head";

@implementation MainViewController

- (NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];

    [self loadData];
    
}

- (void)setUpView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *collectioView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectioView.backgroundColor = [UIColor whiteColor];
    collectioView.delegate = self;
    collectioView.dataSource = self;
    [self.view addSubview:collectioView];
    self.collectionView = collectioView;
    
    [self.collectionView registerClass:[HotCell class] forCellWithReuseIdentifier:ID];
    
    [self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:head];
}

- (void)loadData{
    NSDictionary *dict = [NSDictionary dictionary];
    dict = @{@"app":@"book518",@"t":@"1",@"ver":@"1.3"};
    
    [HotTool hotListWithParameters:dict success:^(NSArray *array) {
        [self.items addObjectsFromArray:array];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.items.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    BooksResult *books = self.items[section];
    return books.books.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    BooksResult *books = self.items[indexPath.section];
    BookResult *book = books.books[indexPath.row];
    cell.book = book;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = self.view.frame.size.width/4;
    return CGSizeMake(width, 150);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:head forIndexPath:indexPath];
        BooksResult *books = self.items[indexPath.section];
        headerView.books = books;
        headerView.delegate = self;
        reusableview = headerView;
    }
    return reusableview;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.frame.size.width, 30);
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 20, 10);
}

#pragma mark --HeaderDelegate
- (void)headerViewClickSelecte:(HeaderView *)headerView selIndex:(NSInteger)selIndex title:(NSString *)title{
    MoreViewController *more = [[MoreViewController alloc]init];
    more.title = title;
    more.selIndex = selIndex;
    more.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:more animated:YES];
}


/**
 
 http://api.b.luckyamy.com/?app=book518&t=2&cat=17&p=1&ver=1.3 
 http://api.b.luckyamy.com/?app=book518&t=2&cat=17&p=2&ver=1.3
 http://api.b.luckyamy.com/?app=book518&t=2&cat=17&p=3&ver=1.3
 http://api.b.luckyamy.com/?app=book518&t=2&cat=17&p=3&ver=1.3
 
 http://api.b.luckyamy.com/?app=book518&t=2&ver=1.3 分类
 
 http://api.b.luckyamy.com/?app=book518&t=1&bid=6690&ver=1.3 查看目录
 
 http://api.b.luckyamy.com/?app=book518&t=1&bid=2903&ver=1.3 加入书架
 
 
 http://api.b.luckyamy.com/?app=book518&t=3&bid=2903&cid=1&ver=1.3
 
 
 **/

@end
