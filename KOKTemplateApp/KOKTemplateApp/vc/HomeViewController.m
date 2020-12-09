//
//  HomeViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import "HomeViewController.h"
#import "YYFPSLabel.h"
#import "SceneDelegate.h"

#import "MakeGoodsFreshFlowerViewController.h"
#import "SendFlowersLIstVC.h"
@interface HomeViewController ()
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _fpsLabel = [YYFPSLabel new];
//    _fpsLabel.frame = CGRectMake(200, 200, 50, 30);
//    [_fpsLabel sizeToFit];
//    [self.view addSubview:_fpsLabel];
//    UIWindow *window2 = [[UIWindow alloc]initWithWindowScene:[SceneDelegate shared].windowScene];
////
////    UIWindowScene *windowScene2= [UIWindowScene alloc]initWithSession: connectionOptions:(nonnull UISceneConnectionOptions *)
//    window2.frame = CGRectMake(200, 200, 200, 200);
//    
//    UIViewController *vc =     [[UIViewController alloc]init];
//    vc.view.backgroundColor = [UIColor redColor];
//    window2.rootViewController = vc;
//    window2.windowLevel = 100000;
//    window2.hidden = NO;
//    [window2 makeKeyAndVisible];
}
#pragma mark - Make Fresh Flowers
- (IBAction)makeGoodsFreshFlower:(UIButton *)sender {
    
    MakeGoodsFreshFlowerViewController *vc = [[MakeGoodsFreshFlowerViewController alloc]initWithNibName:@"MakeGoodsFreshFlowerViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];

}
- (IBAction)flowersLsit:(UIButton *)sender {
    
}
- (IBAction)senderFlowerList:(UIButton *)sender {
    SendFlowersLIstVC *vc = [[SendFlowersLIstVC alloc]initWithNibName:@"SendFlowersLIstVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
