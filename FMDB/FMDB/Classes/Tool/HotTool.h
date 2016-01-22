//
//  HotTool.h
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HotTool : NSObject


+ (void)hotListWithParameters:(NSDictionary *)parameters success:(void (^)(NSArray *array))success failure:(void(^)(NSError *error))failure;


+ (void)more:(NSDictionary *)parameters success:(void (^)(NSArray *array))success failure:(void(^)(NSError *error))failure;
@end
