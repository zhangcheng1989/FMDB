//
//  CacheTool.m
//  FMDB
//
//  Created by iOS on 16/1/21.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "CacheTool.h"
#import "FMDB.h"
#import "BookResult.h"
#import "MJExtension.h"
#define kUserTableName @"book"

static FMDatabase *db;

@implementation CacheTool

+ (void)initialize{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dbPath = [document stringByAppendingPathComponent:@"/book.sqlite"];
    db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString * sql = @"CREATE TABLE IF NOT EXISTS book (id integer primary key AUTOINCREMENT , dict BLOB not null ) ;";
        if (![db executeUpdate:sql]) {
            NSLog(@"数据库创表失败");
        } else {
            NSLog(@"数据库创表成功");
        }
    }else{
        NSLog(@"数据库打开失败");
    }
}

+ (void)saveBook:(NSArray *)books{
    for (NSDictionary *dict in books) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
        BOOL success = [db executeUpdate:@"INSERT INTO book(dict) VALUES(?) ",data];
        if (success) {
            NSLog(@"插入成功");
        }else{
            NSLog(@"插入失败");
        }
    }
}

+ (NSArray *)findBook{
    FMResultSet *set;
     set = [db executeQuery:@"select * from book order by id desc ; "];
    NSMutableArray *arrM = [NSMutableArray array];
    while ([set next]) {
        NSData *data = [set dataForColumn:@"dict"];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        BookResult *book = [BookResult mj_objectWithKeyValues:dict];
        [arrM addObject:book];
    }
    return arrM;
}

+ (BOOL)delBook:(NSInteger)ids{
  
    NSString *sql = [NSString stringWithFormat:@" delete from book where id = %li",ids];
    return [db executeUpdate:sql];
}

@end
