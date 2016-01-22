//
//  BooksResult.h
//  FMDB
//
//  Created by iOS on 16/1/20.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BooksResult : NSObject
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSArray *books;
@end