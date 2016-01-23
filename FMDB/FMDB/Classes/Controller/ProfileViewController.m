//
//  ProfileViewController.m
//  FMDB
//
//  Created by iOS on 16/1/22.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileCell.h"
#import "CacheTool.h"
#import "BookResult.h"
#import "BookFrame.h"
#import "MBProgressHUD+HUD.h"
#import "DetailsViewController.h"
@interface ProfileViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *books;
@end

@implementation ProfileViewController

- (NSMutableArray *)books{
    if (_books == nil) {
        NSArray *array = [CacheTool findBook];
        NSMutableArray *arrM = [NSMutableArray array];
        for (BookResult *book in array) {
            BookFrame *bookFrame = [[BookFrame alloc]init];
            bookFrame.book = book;
            [arrM addObject:bookFrame];
        }
        _books = arrM;
    }
    return _books;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moveRow) name:@"moveRow" object:nil];
}


#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProfileCell *cell = [ProfileCell profileWithTableView:tableView];
    BookFrame *bookFrame = self.books[indexPath.row];
    cell.bookFrame = bookFrame;
    return cell;
}

#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookFrame *frame = self.books[indexPath.row];
    return frame.cellHeight;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *delAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.books removeObjectAtIndex:indexPath.row];
        if ([CacheTool delBook:indexPath.row+1]) {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        }else{
            [MBProgressHUD showError:@"删除失败"];
        }
        
    }];
    
    return @[delAction];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BookFrame *frame = self.books[indexPath.row];
    
    DetailsViewController *detailsVC = [[DetailsViewController alloc]init];
    detailsVC.title = frame.book.name;
    [self.navigationController pushViewController:detailsVC animated:YES];
}

#pragma mark --修改cell的位置
- (void)moveRow{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    [self.books exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
    [self.tableView moveRowAtIndexPath:indexPath toIndexPath:toIndexPath];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}


//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    
//    BookFrame *frame = self.books[sourceIndexPath.row];
//    [self.books removeObject:frame];
//    [self.books insertObject:frame atIndex:destinationIndexPath.row];
////    [self.books exchangeObjectAtIndex:inde withObjectAtIndex:<#(NSUInteger)#>]
//}

@end
