//
//  MyCollectionViewLayout.m
//  collectionView
//
//  Created by zhangmaochun on 2018/1/26.
//  Copyright © 2018年 zhangmaochun. All rights reserved.
//

#import "MyCollectionViewLayout.h"
#define ScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface MyCollectionViewLayout()

//c存放所有cell的布局属性
@property (nonatomic, strong) NSMutableArray *attrsArray;

/** 内容的高度 */
@property (nonatomic, assign) CGFloat contentHeight;



@end
@implementation MyCollectionViewLayout

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (void)prepareLayout
{
    [super prepareLayout];
    self.contentHeight = 0;
    //把初始化的操作都放到这里
    [self.attrsArray removeAllObjects];
    
    //开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++) {
        // 创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    float x = 0.0;
    float y = 0.0;
    float w = 0.0;
    float h = 0.0;
    if (indexPath.row % 3 == 0)
    {
        int tmp = (int)((indexPath.row)/3);
        x = 8.0;
        y = 8.0*(tmp+1)+208.0*tmp;
        w = (ScreenWidth-8*3)/2.0;
        h = 208.0;
    }
    if (indexPath.row % 3 == 1)
    {
        int tmp = (int)((indexPath.row-1)/3);
        x = 8.0*2+(ScreenWidth-8*3)/2.0;
        y = 8.0*(tmp+1)+208.0*tmp;
        w = (ScreenWidth-8*3)/2.0;
        h = 100.0;
        
    }
    if (indexPath.row % 3 == 2)
    {
        int tmp = (int)((indexPath.row-2)/3);
        x = 8.0*2+(ScreenWidth-8*3)/2.0;
        y = 8.0*(tmp+2)+208.0*tmp+100;
        w = (ScreenWidth-8*3)/2.0;
        h = 100.0;
    }
    self.contentHeight = y;
    attrs.frame = CGRectMake(x, y, w, h);
    
    return attrs;
}
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.contentHeight);
}

@end
