//
//  myTableViewCell.h
//  自适应高度
//
//  Created by lanou3g on 15/11/26.
//  Copyright © 2015年 陈伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell
@property (nonatomic, strong)  UILabel *labelLyric;
@property (nonatomic, strong)  UIImageView *picImageView;
- (void)configForCellOfImageSring:(NSString *)image labelHeiht:(NSString *)height;
- (CGFloat)configForCellOfHeight:(NSString *)height;
- (CGFloat)setImageSize:(NSString *)imageString;
@end
