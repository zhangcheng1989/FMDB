//
//  CacheTool.h
//  FMDB
//
//  Created by iOS on 16/1/21.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CacheTool : NSObject


+ (void)saveBook:(NSArray *)books;


+ (NSArray *)findBook;

+ (BOOL)delBook:(NSInteger)ids;

@end
