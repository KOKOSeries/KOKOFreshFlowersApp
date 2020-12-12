//
//  ChooseVaseVC.h
//  KOKTemplateApp
//
//  Created by KOK on 8/12/2020.
//

#import <UIKit/UIKit.h>
typedef void(^SlelectVaseBlock)(id _Nullable data);
NS_ASSUME_NONNULL_BEGIN

@interface ChooseVaseVC : UIViewController
@property (strong,nonatomic) SlelectVaseBlock vaseBlock;

@end

NS_ASSUME_NONNULL_END
