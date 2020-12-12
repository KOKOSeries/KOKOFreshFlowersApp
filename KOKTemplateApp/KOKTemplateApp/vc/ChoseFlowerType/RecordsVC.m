//
//  RecordsVC.m
//  KOKTemplateApp
//
//  Created by JOY CHOW on 2020/12/10.
//

#import "RecordsVC.h"
#import "FlowerCCell.h"
@interface RecordsVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation RecordsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Records";
    [self.view addSubview:self.collectionView];
    self.dataArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"records"];
    [self.collectionView reloadData];
}
#pragma mark - CollectionView 代理
 -(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
 return UIEdgeInsetsMake(5,5,5,5);
 }

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FlowerCCell *cell = (FlowerCCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FlowerCCell" forIndexPath:indexPath];
    NSDictionary *dic = _dataArray[indexPath.row];
    cell.img.image = [UIImage imageWithData:dic[@"image"]];
//    cell.backgroundColor = []
    cell.backgroundColor= [UIColor colorNamed:@"tintColor"];
    cell.img.backgroundColor = [UIColor colorNamed:@"tintColor"];
    cell.label.text = [self time_timestampToString:dic[@"time"]];
    return cell;
}
//时间戳转字符串
- (NSString *)time_timestampToString:(NSString *)timestamp{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp.integerValue];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
     [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString* string=[dateFormat stringFromDate:confromTimesp];
    return string;
}

#pragma mark - set/get
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
        flow.scrollDirection = UICollectionViewScrollDirectionVertical;
        flow.itemSize = CGSizeMake((SCREEN_WIDTH-15)/2, (SCREEN_WIDTH-15)/2);
        flow.minimumLineSpacing = 5;
        flow.minimumInteritemSpacing = 5;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bounds.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - navHeight) collectionViewLayout:flow];
        [_collectionView registerNib:[UINib nibWithNibName:@"FlowerCCell" bundle:nil] forCellWithReuseIdentifier:@"FlowerCCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor =UIColor.clearColor;
    }
    return _collectionView;
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

