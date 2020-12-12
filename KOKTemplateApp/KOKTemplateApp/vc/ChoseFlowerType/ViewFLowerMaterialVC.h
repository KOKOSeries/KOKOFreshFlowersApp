//
//  ViewFLowerMaterialVC.h
//  KOKTemplateApp
//
//  Created by KOK on 7/12/2020.
//

#import <UIKit/UIKit.h>
typedef void(^SlelectFlowerTypeBlock)(id _Nullable data);
NS_ASSUME_NONNULL_BEGIN

@interface ViewFLowerMaterialVC : UIViewController
@property (strong,nonatomic) SlelectFlowerTypeBlock flowerTypeblock;

@end

NS_ASSUME_NONNULL_END
