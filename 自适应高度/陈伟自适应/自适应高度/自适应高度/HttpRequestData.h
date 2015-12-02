//
//  HttpRequestData.h
//  数据库测试
//
//  Created by lanou3g on 15/11/26.
//  Copyright © 2015年 陈伟. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SetBlock)(NSArray *array);
@interface HttpRequestData : NSObject
@property (nonatomic, strong) NSMutableArray *dataArray;
-(void)httpRequestWithDataUrlString:(NSString *)urlString dataBlock:(SetBlock)block;
@end
