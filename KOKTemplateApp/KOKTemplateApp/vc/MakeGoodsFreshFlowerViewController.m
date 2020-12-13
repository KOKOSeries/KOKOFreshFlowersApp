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
#import "ExampleVC.h"
@interface MakeGoodsFreshFlowerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *vaseImageView;
@property (weak, nonatomic) IBOutlet UIImageView *flowerImageVIew;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UIButton *recordsBtn;
@property (nonatomic, strong) NumberView *numberView;
@property (weak, nonatomic) IBOutlet UILabel *flowersNumers;

@end

@implementation MakeGoodsFreshFlowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Make Fresh Flower";
    _numberView = [NumberView newView];
    [self.view addSubview:_numberView];
    self.sendBtn.layer.cornerRadius = 18;
    self.sendBtn.layer.masksToBounds = YES;
    self.recordsBtn.layer.cornerRadius = 9;
    self.recordsBtn.layer.masksToBounds = YES;
    //    [_numberView show];
    [ChooseModel sharedManager].number = @"1";
}
- (IBAction)makeFreshFlowerExample:(UIButton *)sender {
    FinishVC *vc = [[FinishVC alloc]initWithNibName:@"FinishVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)ChooseVase:(UIButton *)sender {
    ChooseVaseVC *vc = [[ChooseVaseVC alloc]initWithNibName:@"ChooseVaseVC" bundle:nil];
    vc.vaseBlock = ^(id  _Nullable data) {
        self.vaseImageView.image = [UIImage imageNamed:(NSString *)data];
    };
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)ChooseFlowerType:(UIButton *)sender {
    ViewFLowerMaterialVC *vc  = [[ViewFLowerMaterialVC alloc]initWithNibName:@"ViewFLowerMaterialVC" bundle:nil];
    vc.flowerTypeblock = ^(id data) {
        NSLog(@"%@",data);
        self.flowerImageVIew.image = [UIImage imageNamed:(NSString *)data];
    };
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)ChooseFlowerNumber:(UIButton *)sender {
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"Choose Flowwer Numbers" message:@"Default is 1 flowers" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *oneAction = [UIAlertAction actionWithTitle:@"1 flowers" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ChooseModel sharedManager].number = @"1";
        self.flowersNumers.text = @"1 flowers";
    }];
    
    UIAlertAction *twoAction = [UIAlertAction actionWithTitle:@"2 flowers" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ChooseModel sharedManager].number = @"2";
        self.flowersNumers.text = @"2 flowers";
    }];
    
    [vc addAction:oneAction];
    [vc addAction:twoAction];
    
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)Eample:(UIButton *)sender {
    ExampleVC *vc = [[ExampleVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
