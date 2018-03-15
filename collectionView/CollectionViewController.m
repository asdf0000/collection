//
//  CollectionViewController.m
//  collectionView
//
//  Created by zhangmaochun on 2018/1/26.
//  Copyright © 2018年 zhangmaochun. All rights reserved.
//

#import "CollectionViewController.h"
#import "MyCollectionViewLayout.h"
#define ScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    MyCollectionViewLayout *layout = [[MyCollectionViewLayout alloc]init];
    self.collectionView.collectionViewLayout = layout;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 180;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor blueColor];
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
