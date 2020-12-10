//
//  ChooseVaseVC.m
//  KOKTemplateApp
//
//  Created by KOK on 8/12/2020.
//

#import "ChooseVaseVC.h"
#import "FlowerCCell.h"
@interface ChooseVaseVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    FlowerCCell * _cellOld;
}
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ChooseVaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"choose a vase";
    [self.view addSubview:self.collectionView];
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithObject:[NSString stringWithFormat:@"vase%d",i] forKey:@"vase"];
        
        [dic setObject:@"NO" forKey:@"choose"];
        if ([[ChooseModel sharedManager].vase isEqualToString:dic[@"vase"]]) {
            [dic setObject:@"YES" forKey:@"choose"];
        }
        [self.dataArray addObject:dic];
    }
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
    cell.img.image = [UIImage imageNamed:dic[@"vase"]];
    if ([dic[@"choose"] isEqual:@"YES"]) {
        cell.imgSelected.hidden = NO;
        _cellOld = cell;
    } else {
        cell.imgSelected.hidden = YES;
    }
    cell.img.backgroundColor = UIColor.whiteColor;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FlowerCCell *cell = (FlowerCCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.imgSelected.hidden = NO;
    NSDictionary *dic = _dataArray[indexPath.row];
    [ChooseModel sharedManager].vase = dic[@"vase"];
    if (_cellOld) {
        _cellOld.imgSelected.hidden = YES;
    }
    _cellOld = cell;
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
