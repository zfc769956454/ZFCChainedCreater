//
//  BKCollectionViewProtocolHelper.h
//  ChainDemo
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFC_CollectionChainedInvokeConfig.h"

@class  ZFC_CollectionViewChainnedInvokeCreater;


typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_collectionViewConfigure)(ZFC_CollectionChainedInvokeConfig *collectionConfig);

/**
  返回section数量
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_numberOfSectionsInCollectionView)(NSInteger(^)(UICollectionView *collectionView));
/**
 返回item数量
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_numberOfItemsInSection)(NSInteger(^)(UICollectionView *collectionView,NSInteger section));
/**
 返回itemSize
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_sizeForItemAtIndexPath)(CGSize(^)(UICollectionView *collectionView,NSIndexPath * indexPath));
/**
 返回cell
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_cellForItemAtIndexPath)(void(^)(UICollectionView *collectionView,__kindof UICollectionViewCell * cell, NSIndexPath * indexPath));

/**
 返回段头高度
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_referenceSizeForHeaderInSection)(CGSize(^)(UICollectionView *collectionView,NSInteger section));
/**
 返回段头
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_collectionElementKindSectionHeader)(void(^)(UICollectionView *collectionView,__kindof UICollectionReusableView *sectionHeaderView,NSInteger section));
/**
 返回段尾高度
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_referenceSizeForFooterInSection)(CGSize(^)(UICollectionView *collectionView,NSInteger section));
/**
 返回段尾
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_collectionElementKindSectionFooter)(void(^)(UICollectionView *collectionView,__kindof UICollectionReusableView *sectionFooterView,NSInteger section));

/**
 点击
 */
typedef ZFC_CollectionViewChainnedInvokeCreater *(^ZFC_didSelectItemAtIndexPath)(void(^)(UICollectionView *collectionView,NSIndexPath * indexPath));



@interface ZFC_CollectionViewChainnedInvokeCreater : NSObject


/** collectionView基本配置 */
@property (nonatomic,copy,readonly) ZFC_collectionViewConfigure zfc_collectionViewConfigure;

/** section数量 */
@property (nonatomic,copy,readonly) ZFC_numberOfSectionsInCollectionView zfc_numberOfSectionsInCollectionView;
/** item数量 */
@property (nonatomic,copy,readonly) ZFC_numberOfItemsInSection zfc_numberOfItemsInSection;
/** itemSize */
@property (nonatomic,copy,readonly) ZFC_sizeForItemAtIndexPath zfc_sizeForItemAtIndexPath;
/** 返回item */
@property (nonatomic,copy,readonly) ZFC_cellForItemAtIndexPath zfc_cellForItemAtIndexPath;

/** 段头高 */
@property (nonatomic,copy,readonly) ZFC_referenceSizeForHeaderInSection zfc_referenceSizeForHeaderInSection;
/** 段头view */
@property (nonatomic,copy,readonly) ZFC_collectionElementKindSectionHeader  zfc_collectionElementKindSectionHeader;
/** 段尾高 */
@property (nonatomic,copy,readonly) ZFC_referenceSizeForFooterInSection zfc_referenceSizeForFooterInSection;
/** 段尾view */
@property (nonatomic,copy,readonly) ZFC_collectionElementKindSectionFooter   zfc_collectionElementKindSectionFooter;

/** selected */
@property (nonatomic,copy,readonly) ZFC_didSelectItemAtIndexPath zfc_didSelectItemAtIndexPath;

/**
 刷新
 */
- (void)zfc_reloadData;


@end


