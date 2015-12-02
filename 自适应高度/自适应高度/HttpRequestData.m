//
//  HttpRequestData.m
//  数据库测试
//
//  Created by lanou3g on 15/11/26.
//  Copyright © 2015年 陈伟. All rights reserved.
//

#import "HttpRequestData.h"

@implementation HttpRequestData

- (void)httpRequestWithDataUrlString:(NSString *)urlString dataBlock:(SetBlock)block{
dispatch_async(dispatch_get_global_queue(0, 0), ^{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
     NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         NSArray *array = [[[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil] valueForKey:@"body"] valueForKey:@"slides"];
       for (NSDictionary *dic in array) {
           MusicListModel *model = [[MusicListModel alloc] init];
           [model setValuesForKeysWithDictionary:dic];
           [self.dataArray addObject:model];
       }
       dispatch_async(dispatch_get_main_queue(), ^{
           block(self.dataArray);
       });
   }];
    [task resume];

});

}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
