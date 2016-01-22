//
//  Http.m
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "Http.h"
#import "AFNetworking.h"
@implementation Http


+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    NSCharacterSet *charser = [NSCharacterSet URLHostAllowedCharacterSet];
    [URLString stringByAddingPercentEncodingWithAllowedCharacters:charser];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSCharacterSet *charser = [NSCharacterSet URLHostAllowedCharacterSet];
    [URLString stringByAddingPercentEncodingWithAllowedCharacters:charser];
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
