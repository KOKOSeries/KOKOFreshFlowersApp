//
//  MakeGoodsFreshFlowerViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 7/12/2020.
//

#import "MakeGoodsFreshFlowerViewController.h"
#import "ChooseVaseVC.h"
#import "ChoseBackImageVC.h"
#import "ViewFLowerMaterialVC.h"
#import "PreFlowerVC.h"
@interface MakeGoodsFreshFlowerViewController ()

@end

@implementation MakeGoodsFreshFlowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Make Fresh Flower";
    
}
- (IBAction)makeFreshFlowerExample:(UIButton *)sender {

}
- (IBAction)ChooseVase:(UIButton *)sender {
    
    ChooseVaseVC *vc = [[ChooseVaseVC alloc]initWithNibName:@"ChooseVaseVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)ChooseFlowerType:(UIButton *)sender {
    ViewFLowerMaterialVC *vc  = [[ViewFLowerMaterialVC alloc]initWithNibName:@"ViewFLowerMaterialVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)ChooseFlowerNumber:(UIButton *)sender {
    
}
- (IBAction)ChooseBackColor:(UIButton *)sender {
    
}
- (IBAction)ChooseBackImage:(UIButton *)sender {
    ChoseBackImageVC *vc = [[ChoseBackImageVC alloc]initWithNibName:@"ChoseBackImageVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)saveFlowers:(UIButton *)sender {
    PreFlowerVC *vc = [[PreFlowerVC alloc]initWithNibName:@"PreFlowerVC" bundle:nil];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
