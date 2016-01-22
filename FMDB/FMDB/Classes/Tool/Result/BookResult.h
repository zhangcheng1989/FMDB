//
//  BookResult.h
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookResult : NSObject
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *categoryId;
@property(nonatomic,copy)NSString *chapters;
@property(nonatomic,copy)NSURL *cover;
@property(nonatomic,copy)NSString *descr;
@property(nonatomic,assign)int finished;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *size;
@property(nonatomic,assign)int vip;
@property(nonatomic,copy)NSString *words;
@end
