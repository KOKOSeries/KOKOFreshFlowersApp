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
#import "NumberView.h"
#import "FinishVC.h"
#import "RecordsVC.h"
@interface MakeGoodsFreshFlowerViewController ()
@property (nonatomic, strong) NumberView *numberView;
@end

@implementation MakeGoodsFreshFlowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Make Fresh Flower";
    
    _numberView = [NumberView newView];
    [self.view addSubview:_numberView];
}
- (IBAction)makeFreshFlowerExample:(UIButton *)sender {
    FinishVC *vc = [[FinishVC alloc]initWithNibName:@"FinishVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
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
    [_numberView show];
    
}
- (IBAction)ChooseBackColor:(UIButton *)sender {
    
}
- (IBAction)ChooseBackImage:(UIButton *)sender {
    RecordsVC *vc = [[RecordsVC alloc]initWithNibName:@"RecordsVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)saveFlowers:(UIButton *)sender {
    PreFlowerVC *vc = [[PreFlowerVC alloc]initWithNibName:@"PreFlowerVC" bundle:nil];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
