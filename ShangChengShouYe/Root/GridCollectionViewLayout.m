//
//  GridCollectionViewLayout.m
//  DMV1
//
//  Created by DaLei on 2017/6/26.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "GridCollectionViewLayout.h"

@implementation GridCollectionViewLayout

-(NSMutableArray *)attrsArray{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

-(void)prepareLayout{
    [super prepareLayout];
    int w = self.collectionView.frame.size.width;
    int h = self.collectionView.frame.size.height;
    for (NSInteger i = 0; i < 8; i++) {
        // 创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 创建布局属性
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        if (i == 0) {
            attrs.frame = CGRectMake(0, 0, w*0.375 , h*0.58);
        }
        if (i == 1) {
            attrs.frame = CGRectMake(w*0.375, 0, w*(1-0.375) , h*0.58*0.45);
        }
        if (i == 2) {
            attrs.frame = CGRectMake(w*0.375, h*0.58*0.45 , w*(1-0.375)/2 , h*0.58*0.55);
        }
        if (i == 3) {
            attrs.frame = CGRectMake(w*0.375 + w*(1-0.375)/2, h*0.58*0.45 , w*(1-0.375)/2 , h*0.58*0.55);
        }
        if (i == 4) {
            attrs.frame = CGRectMake(0, h*0.58, w/4 , h*(1-0.58));
        }
        if (i == 5) {
            attrs.frame = CGRectMake(w/4, h*0.58, w/4 , h*(1-0.58));
        }
        if (i == 6) {
            attrs.frame = CGRectMake(w/4*2, h*0.58, w/4 , h*(1-0.58));
        }
        if (i == 7) {
            attrs.frame = CGRectMake(w/4*3, h*0.58, w/4 , h*(1-0.58));
        }
        [self.attrsArray addObject:attrs];
    }
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArray;
}


@end
