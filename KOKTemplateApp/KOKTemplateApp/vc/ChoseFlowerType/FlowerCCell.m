//
//  FlowerCCell.m
//  KOKTemplateApp
//
//  Created by JOY CHOW on 2020/12/9.
//

#import "FlowerCCell.h"

@implementation FlowerCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
}

@end
