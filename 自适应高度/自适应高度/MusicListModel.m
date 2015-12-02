//
//  MusicListModel.m
//  数据库测试
//
//  Created by lanou3g on 15/11/26.
//  Copyright © 2015年 陈伟. All rights reserved.
//

#import "MusicListModel.h"

@implementation MusicListModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.descriptions = value;
    }
}
@end
