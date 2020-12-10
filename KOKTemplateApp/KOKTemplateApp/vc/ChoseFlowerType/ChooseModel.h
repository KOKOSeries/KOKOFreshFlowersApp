//
//  ChooseModel.h
//  KOKTemplateApp
//
//  Created by JOY CHOW on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChooseModel : NSObject
@property(nonatomic,copy)NSString * vase;
@property(nonatomic,copy)NSString * flower;
@property(nonatomic,copy)NSString * number;
+(ChooseModel *)sharedManager;
- (void)clean;
@end

NS_ASSUME_NONNULL_END
