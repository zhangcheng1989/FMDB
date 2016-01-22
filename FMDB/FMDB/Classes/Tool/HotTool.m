//
//  HotTool.m
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "HotTool.h"
#import "MJExtension.h"
#import "BooksResult.h"
#import "BookResult.h"
#import "Http.h"
#import "CacheTool.h"
@implementation HotTool

+ (void)hotListWithParameters:(NSDictionary *)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    [Http GET:@"http://api.b.luckyamy.com" parameters:[parameters mj_keyValues] success:^(id responseObject) {
        NSArray *array = [BooksResult mj_objectArrayWithKeyValuesArray:responseObject[@"hot"]];
        NSMutableArray *arrM = [NSMutableArray array];
        for (BooksResult *books in array) {
            [arrM addObject:books];
        }
        if (success) {
            success(arrM);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}


+ (void)more:(NSDictionary *)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    
//    NSArray *array = [CacheTool findBook];
//    
//    if (array.count) {
//        if (success) {
//            success(array);
//        }
//        return;
//    }
    
    
    [Http GET:@"http://api.b.luckyamy.com" parameters:parameters success:^(id responseObject) {
        [CacheTool saveBook:responseObject];
        
        NSArray *array  = [BookResult mj_objectArrayWithKeyValuesArray:responseObject];
        if (success) {
            success(array);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
