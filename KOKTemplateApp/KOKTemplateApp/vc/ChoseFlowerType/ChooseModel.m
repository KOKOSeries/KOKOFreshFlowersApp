//
//  ChooseModel.m
//  KOKTemplateApp
//
//  Created by JOY CHOW on 2020/12/9.
//

#import "ChooseModel.h"

@implementation ChooseModel
+(ChooseModel *)sharedManager{
  static dispatch_once_t predicate;
  static ChooseModel * sharedManager;
  dispatch_once(&predicate, ^{
    sharedManager=[[ChooseModel alloc] init];
  });
  return sharedManager;
}
- (void)clean
{
    _vase = nil;
    _flower = nil;
    _number = nil;
}
@end
