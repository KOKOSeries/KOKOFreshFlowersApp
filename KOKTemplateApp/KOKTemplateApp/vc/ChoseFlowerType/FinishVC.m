//
//  FinishVC.m
//  KOKTemplateApp
//
//  Created by JOY CHOW on 2020/12/9.
//

#import "FinishVC.h"

@interface FinishVC ()
{
    UIButton * _btn;
}
@end

@implementation FinishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self refreshUI];
}

- (void)createUI
{
    _imgC = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 250)];
    _imgC.center = CGPointMake(SCREEN_WIDTH/2 - 5, _mainView.height/2);
    [_mainView addSubview:_imgC];
//    _imgC.image = [UIImage imageNamed:@"flower0"];
    
    _imgL = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 250)];
    _imgL.center = CGPointMake(SCREEN_WIDTH/2 - 25, _mainView.height/2);
    [_mainView addSubview:_imgL];
//    _imgL.image = [UIImage imageNamed:@"flower0"];
    _imgL.transform = CGAffineTransformMakeRotation(-M_PI*0.1);
    
    _imgR = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 250)];
    _imgR.center = CGPointMake(SCREEN_WIDTH/2 + 20, _mainView.height/2);
    [_mainView addSubview:_imgR];
//    _imgR.image = [UIImage imageNamed:@"flower0"];
    _imgR.transform = CGAffineTransformMakeRotation(M_PI*0.1);
    [_mainView bringSubviewToFront:_imgVase];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREEN_WIDTH - 120, 20, 80, 40);
    [button setTitleColor:UIColorFromRGB(0x202d39) forState:0];
    [button setTitle:@"save" forState:0];
    [self.navigationController.navigationBar addSubview:button];
    [button addTarget:self action:@selector(saveData) forControlEvents:(UIControlEventTouchUpInside)];
    _btn = button;
}

- (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [[UIScreen mainScreen] scale]);//图形以选项开始图像上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];/**渲染属性和方法。* * /
/*将接收器及其子处理器呈现为“ctx”。这个方法
*从图层树直接渲染。在坐标空间中呈现的层。
*/
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();//*图像从当前图像上下文获取图像
    UIGraphicsEndImageContext();//结束图像上下文
    return img;
}

- (void)refreshUI
{
    _imgVase.image = [UIImage imageNamed:[ChooseModel sharedManager].vase];
    switch ([ChooseModel sharedManager].number.intValue) {
        case 1:
            _imgC.image = [UIImage imageNamed:[ChooseModel sharedManager].flower];
            break;
        case 2:
            _imgL.image = [UIImage imageNamed:[ChooseModel sharedManager].flower];
            _imgR.image = [UIImage imageNamed:[ChooseModel sharedManager].flower];
            break;
        case 3:
            _imgC.image = [UIImage imageNamed:[ChooseModel sharedManager].flower];
            _imgL.image = [UIImage imageNamed:[ChooseModel sharedManager].flower];
            _imgR.image = [UIImage imageNamed:[ChooseModel sharedManager].flower];
            break;
            
        default:
            break;
    }
    
}

//获取当前时间戳
- (NSString *)currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970];// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

-(void)saveData
{
    NSMutableDictionary * data = [NSMutableDictionary dictionary];
    [data setValue:[self currentTimeStr] forKey:@"time"];
    [data setValue:UIImagePNGRepresentation([self imageWithView:_mainView]) forKey:@"image"];
    NSArray * arr = [[NSUserDefaults standardUserDefaults] objectForKey:@"records"];
    NSMutableArray * array = [NSMutableArray arrayWithArray:arr];
    if (array.count < 1) {
        array = [NSMutableArray array];
    }
    [array addObject:data];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"records"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_btn setTitle:@"success" forState:0];
        _btn.enabled = NO;
    });
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_btn removeFromSuperview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
