//
//  myTableViewCell.m
//  自适应高度
//
//  Created by lanou3g on 15/11/26.
//  Copyright © 2015年 陈伟. All rights reserved.
//

#import "myTableViewCell.h"
@implementation myTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllView];
    }
    return self;
}
/**
 *  初始化控件
 */
- (void)addAllView{
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, kwith-20, 50)];
    [self.contentView addSubview:self.picImageView];
    self.labelLyric = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.picImageView.frame), kwith-20, 100)];
    self.labelLyric.numberOfLines = 0;
    self.labelLyric.font = [UIFont systemFontOfSize:19.0];
    [self.contentView addSubview:self.labelLyric];

}


- (CGFloat)configForCellOfHeight:(NSString *)height{
    CGSize size = CGSizeMake(kwith-20, 0);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:19.0]};
    CGRect rect = [height boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
    
}


- (CGFloat)setImageSize:(NSString *)imageString{
   UIImage *image = [self requestFromImageStringToImage:imageString];
    CGFloat newheight = image.size.height*(kwith-20)/image.size.width;
    return newheight;
}


- (void)configForCellOfImageSring:(NSString *)image labelHeiht:(NSString *)height{
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:image]];
    self.labelLyric.text = height;
    self.picImageView.frame = CGRectMake(10, 0, kwith-20, [self setImageSize:image]);
    self.labelLyric.frame = CGRectMake(10, CGRectGetMaxY(self.picImageView.frame), kwith-20, [self configForCellOfHeight:height]);
    
   
}
- (UIImage *)requestFromImageStringToImage:(NSString *)imageString{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageString]];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
