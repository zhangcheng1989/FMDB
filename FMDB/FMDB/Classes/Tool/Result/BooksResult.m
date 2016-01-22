//
//  BooksResult.m
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "BooksResult.h"
#import "MJExtension.h"
#import "BookResult.h"
@implementation BooksResult

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"books":[BookResult class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}



@end
