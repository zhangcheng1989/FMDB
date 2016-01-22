//
//  MoreViewController.m
//  FMDB
//
//  Created by iOS on 16/1/21.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "MoreViewController.h"
#import "HotTool.h"
#import "BookResult.h"
#import "HotCell.h"
#import "MJRefresh.h"
#import "MBProgressHUD+HUD.h"
@interface MoreViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,weak)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,assign)NSInteger page;
@end

static NSString *ID = @"more";

@implementation MoreViewController

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
    
    [self addRefresh];
}

- (void)setUpView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 30;
    layout.minimumInteritemSpacing = 0;
    UICollectionView *collectioView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectioView.backgroundColor = [UIColor whiteColor];
    collectioView.delegate = self;
    collectioView.dataSource = self;
    [self.view addSubview:collectioView];
    self.collectionView = collectioView;
    [self.collectionView registerClass:[HotCell class] forCellWithReuseIdentifier:ID];
    
}

- (void)loadData{
    
    NSDictionary *param = [NSDictionary dictionary];
    param = @{@"app":@"book518",@"t":@"2",@"cat":[NSString stringWithFormat:@"%li",self.selIndex],@"p":@"1",@"ver":@"1.3"};
   
    [HotTool more:param success:^(NSArray *array) {
        [self.items addObjectsFromArray:array];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)addRefresh{
    
    __weak __typeof(self)weakSelf = self;

    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        
        NSDictionary *param = [NSDictionary dictionary];
        
        if (self.page == 0) {
            self.page = 2;
        }else{
            self.page ++;
        }
        
        param = @{@"app":@"book518",@"t":@"2",@"cat":[NSString stringWithFormat:@"%li",self.selIndex],@"p":[NSString stringWithFormat:@"%li", self.page],@"ver":@"1.3"};
        [HotTool more:param success:^(NSArray *array) {
            [self.items addObjectsFromArray:array];
            [self.collectionView reloadData];
            [weakSelf.collectionView.mj_footer endRefreshing];
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
        
        
    }];
    
}

#pragma mark --UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    BookResult *book = self.items[indexPath.row];
    cell.book = book;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = self.view.frame.size.width/4;
    return CGSizeMake(width, 150);
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 20, 10);
}



@end
