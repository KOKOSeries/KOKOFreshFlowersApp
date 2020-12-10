//
//  NumberView.h
//  KOKTemplateApp
//
//  Created by JOY CHOW on 2020/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumberView : UIView
@property(nonatomic,strong)UIButton *btnOld;
- (void)show;
- (void)dismiss;
+ (instancetype)newView;
@end

NS_ASSUME_NONNULL_END
