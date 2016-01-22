//
//  FMDBManager.m
//  FMDB
//
//  Created by iOS on 16/1/22.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "FMDBManager.h"
#import "FMDBMigrationManager.h"
@implementation FMDBManager


+ (void)manager{
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *databasePath = [doc stringByAppendingPathComponent:@"/book.sqlite"];
    
    FMDBMigrationManager *manager = [FMDBMigrationManager managerWithDatabaseAtPath:databasePath  migrationsBundle:[NSBundle mainBundle]];
    
    BOOL resultState = NO;
    NSError *error = nil;
    if (!manager.hasMigrationsTable) {
        resultState = [manager createMigrationsTable:&error];
    }
    
    resultState = [manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];//迁移函数
    
    NSLog(@"Has `schema_migrations` table?: %@", manager.hasMigrationsTable ? @"YES" : @"NO");
    NSLog(@"Origin Version: %llu", manager.originVersion);
    NSLog(@"Current version: %llu", manager.currentVersion);
    NSLog(@"All migrations: %@", manager.migrations);
    NSLog(@"Applied versions: %@", manager.appliedVersions);
    NSLog(@"Pending versions: %@", manager.pendingVersions);
}

@end
