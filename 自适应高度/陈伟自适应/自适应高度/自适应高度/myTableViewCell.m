//
//  myTableViewCell.m
//  自适应高度
//
//  Created by lanou3g on 15/11/26.
//  Copyright © 2015年 陈伟. All rights reserved.
//

#import "myTableViewCell.h"
#define kwith  [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height
@implementation myTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllView];
    }
    return self;
}

- (void)addAllView{
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kwith, 50)];
    [self.contentView addSubview:self.picImageView];
    self.labelLyric = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picImageView.frame), kwith, 100)];
    self.labelLyric.numberOfLines = 0;
    self.labelLyric.font = [UIFont systemFontOfSize:16.0];
    [self.contentView addSubview:self.labelLyric];

}
- (CGFloat)configForCellOfHeight:(NSString *)height{
    CGSize size = CGSizeMake(kwith, 0);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:16.0]};
    CGRect rect = [height boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect.size.height;
    
}
- (CGFloat)setImageSize:(UIImage *)image{
    CGFloat newheight = image.size.height*kwith/image.size.width;
    
    return newheight;
}

- (void)configForCellOfImage:(UIImage *)image labelHeiht:(NSString *)height{
    self.picImageView.image = image;
    self.picImageView.frame = CGRectMake(0, 0, kwith, [self setImageSize:image]);
    self.labelLyric.text = height;
    self.labelLyric.frame = CGRectMake(0, CGRectGetMaxY(self.picImageView.frame), kwith, [self configForCellOfHeight:height]);
    
   
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
