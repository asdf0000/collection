//
//  MyCollectionViewLayout.h
//  collectionView
//
//  Created by zhangmaochun on 2018/1/26.
//  Copyright © 2018年 zhangmaochun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCollectionViewLayout;

@protocol MyCollectionViewLayoutDelegate <NSObject>

@end
@interface MyCollectionViewLayout : UICollectionViewLayout
@property (nonatomic ,weak) id<MyCollectionViewLayoutDelegate> delegate;
@end
