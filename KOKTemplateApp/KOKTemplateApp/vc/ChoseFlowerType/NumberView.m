//
//  NumberView.m
//  KOKTemplateApp
//
//  Created by JOY CHOW on 2020/12/9.
//

#import "NumberView.h"

@implementation NumberView
+ (instancetype)newView
{
    NumberView * view  = [[NSBundle mainBundle] loadNibNamed:@"NumberView" owner:nil options:nil].firstObject;
    view.frame = CGRectMake(20, SCREEN_HEIGHT, SCREEN_WIDTH - 40, 250);
    return view;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
}

- (IBAction)deleteClick:(UIButton *)sender {
    [self dismiss];
}
- (IBAction)numClick:(UIButton *)sender {
    sender.backgroundColor = UIColor.blackColor;
    if (_btnOld) {
        _btnOld.backgroundColor = UIColor.lightGrayColor;
    }
    _btnOld = sender;
    [ChooseModel sharedManager].number = sender.titleLabel.text;
}
- (void)show
{
    [UIView animateWithDuration:0.3 animations:^{
        self.y  = SCREEN_HEIGHT - 450;
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        self.y  = SCREEN_HEIGHT;
    }];
}
@end
