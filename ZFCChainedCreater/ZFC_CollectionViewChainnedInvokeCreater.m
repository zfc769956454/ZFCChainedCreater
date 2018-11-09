//
//  BKCollectionViewProtocolHelper.m
//  ChainDemo
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_CollectionViewChainnedInvokeCreater.h"

#define ZFCJointPrexfix_CV(objc)  (self.collectionViewConfig.objc)


@interface ZFC_CollectionViewChainnedInvokeCreater ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/** collectionView基本配置 */
@property (strong, nonatomic) ZFC_CollectionChainedInvokeConfig *collectionViewConfig;


/** section数量 */
@property (nonatomic,copy)NSInteger (^numberOfSectionsInCollectionViewHandle)(UICollectionView *collectionView) ;
/** item数量 */
@property (nonatomic,copy)NSInteger (^numberOfItemsInSectionHandle)(UICollectionView *collectionView,NSInteger section) ;
/** itemSize */
@property (nonatomic,copy)CGSize (^sizeForItemAtIndexPathHandle)(UICollectionView *collectionView,NSIndexPath *indexPath) ;
/** 返回cell */
@property (nonatomic,copy)void (^cellForItemAtIndexPathHandle)(UICollectionView *collectionView,__kindof UICollectionViewCell *cell, NSIndexPath *indexPath) ;


/** 段头size */
@property (nonatomic,copy)CGSize (^referenceSizeForHeaderInSectionHandle)(UICollectionView *collectionView,NSInteger section) ;
/** 段头view */
@property (nonatomic,copy)void (^collectionElementKindSectionHeaderHandle)(UICollectionView *collectionView,UICollectionReusableView *sectionHeaderView,NSInteger section) ;
/** 段尾size */
@property (nonatomic,copy)CGSize (^referenceSizeForFooterInSectionHandle)(UICollectionView *collectionView,NSInteger section) ;
/** 段尾view */
@property (nonatomic,copy)void (^collectionElementKindSectionFooterHandle)(UICollectionView *collectionView,UICollectionReusableView *sectionFooterView,NSInteger section) ;



/** selected */
@property (nonatomic,copy)void (^didSelectItemAtIndexPathHandle)(UICollectionView *collectionView,NSIndexPath *indexPath) ;

@end

@implementation ZFC_CollectionViewChainnedInvokeCreater


- (ZFC_collectionViewConfigure)zfc_collectionViewConfigure {
    

    return ^ZFC_CollectionViewChainnedInvokeCreater *(ZFC_CollectionChainedInvokeConfig *collectionConfig) {
        
        self.collectionViewConfig = collectionConfig;
        
        ZFCJointPrexfix_CV(collectionView).delegate = self;
        ZFCJointPrexfix_CV(collectionView).dataSource = self;
        
        
        NSAssert(ZFCJointPrexfix_CV(cellClass), @"请传入一个cell的类对象");
        ZFCJointPrexfix_CV(isCellXib) ? [ZFCJointPrexfix_CV(collectionView) registerNib:[UINib nibWithNibName:NSStringFromClass(ZFCJointPrexfix_CV(cellClass)) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(ZFCJointPrexfix_CV(cellClass))]:
        [ZFCJointPrexfix_CV(collectionView) registerClass:ZFCJointPrexfix_CV(cellClass) forCellWithReuseIdentifier:NSStringFromClass(ZFCJointPrexfix_CV(cellClass))] ;
        
       
        if (ZFCJointPrexfix_CV(sectionHeaderClass)) {

            NSAssert([[ZFCJointPrexfix_CV(sectionHeaderClass) new] isKindOfClass:[UICollectionReusableView class]], @"请传入段头对象为UICollectionReusableView的类");

            ZFCJointPrexfix_CV(isSectionHeaderXib) ? [ZFCJointPrexfix_CV(collectionView) registerNib:[UINib nibWithNibName:NSStringFromClass(ZFCJointPrexfix_CV(sectionHeaderClass)) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@_header",NSStringFromClass(ZFCJointPrexfix_CV(sectionHeaderClass))]]:
            [ZFCJointPrexfix_CV(collectionView) registerClass:ZFCJointPrexfix_CV(sectionHeaderClass) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@_header",NSStringFromClass(ZFCJointPrexfix_CV(sectionHeaderClass))]];
        }
        if (ZFCJointPrexfix_CV(sectionFooterClass)) {

            NSAssert([[ZFCJointPrexfix_CV(sectionFooterClass) new] isKindOfClass:[UICollectionReusableView class]], @"请传入段尾对象为UICollectionReusableView的类");
            ZFCJointPrexfix_CV(isSectionFooterXib) ? [ZFCJointPrexfix_CV(collectionView) registerNib:[UINib nibWithNibName:NSStringFromClass(ZFCJointPrexfix_CV(sectionFooterClass)) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@_footer",NSStringFromClass(ZFCJointPrexfix_CV(sectionFooterClass))]]:
            [ZFCJointPrexfix_CV(collectionView) registerClass:ZFCJointPrexfix_CV(sectionFooterClass) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@_footer",NSStringFromClass(ZFCJointPrexfix_CV(sectionFooterClass))]];
        }

        return self;
    };
    
}



- (ZFC_numberOfSectionsInCollectionView)zfc_numberOfSectionsInCollectionView{
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(NSInteger (^sectionsHandle)(UICollectionView *collectionView)) {
        
        self.numberOfSectionsInCollectionViewHandle = sectionsHandle;
        
        return self;
    };
}



- (ZFC_numberOfItemsInSection)zfc_numberOfItemsInSection {
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(NSInteger (^itemsHandle)(UICollectionView *collectionView,NSInteger section)) {
        
        self.numberOfItemsInSectionHandle = itemsHandle;
        
        return self;

    };
}


- (ZFC_sizeForItemAtIndexPath)zfc_sizeForItemAtIndexPath {
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(CGSize (^configItemSizeHandle)(UICollectionView *collectionView,NSIndexPath *indexPath)) {
        
        self.sizeForItemAtIndexPathHandle = configItemSizeHandle;
        
        return self;
    };
    
}

- (ZFC_cellForItemAtIndexPath)zfc_cellForItemAtIndexPath {
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(void (^configItemHandle)(UICollectionView *collectionView,__kindof UICollectionViewCell *cell, NSIndexPath *indexPath)) {
        
        self.cellForItemAtIndexPathHandle = configItemHandle;
        return self;
    };
    
}



- (ZFC_referenceSizeForHeaderInSection)zfc_referenceSizeForHeaderInSection {
    
    NSAssert(ZFCJointPrexfix_CV(sectionHeaderClass), @"请传入一个段头的类对象");
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(CGSize (^referenceSizeForHeaderInSection)(UICollectionView *collectionView,NSInteger section)) {
        
        self.referenceSizeForHeaderInSectionHandle  = referenceSizeForHeaderInSection;
        
        return self;
    };
}


- (ZFC_collectionElementKindSectionHeader)zfc_collectionElementKindSectionHeader {
    
    NSAssert(ZFCJointPrexfix_CV(sectionHeaderClass), @"请传入一个段头的类对象");
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(void (^collectionElementKindSectionHeader)(UICollectionView *collectionView,__kindof UICollectionReusableView *headerView,NSInteger section)) {
        
        self.collectionElementKindSectionHeaderHandle = collectionElementKindSectionHeader;
        
        return self;
    };
    
}


- (ZFC_referenceSizeForFooterInSection)zfc_referenceSizeForFooterInSection {
    
    NSAssert(ZFCJointPrexfix_CV(sectionFooterClass), @"请传入一个段尾的类对象");
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(CGSize (^referenceSizeForFooterInSection)(UICollectionView *collectionView,NSInteger section)) {
        
        self.referenceSizeForFooterInSectionHandle  = referenceSizeForFooterInSection;
        
        return self;
    };
    
}

- (ZFC_collectionElementKindSectionFooter)zfc_collectionElementKindSectionFooter {
    
    NSAssert(ZFCJointPrexfix_CV(sectionFooterClass), @"请传入一个段尾的类对象");
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(void (^collectionElementKindSectionFooter)(UICollectionView *collectionView,__kindof UICollectionReusableView *footerView,NSInteger section)) {
        
        self.collectionElementKindSectionFooterHandle = collectionElementKindSectionFooter;
        
        return self;
    };
    
}


- (ZFC_didSelectItemAtIndexPath)zfc_didSelectItemAtIndexPath {
    
    return ^ZFC_CollectionViewChainnedInvokeCreater *(void (^didSelectedHandle)(UICollectionView *collectionView,NSIndexPath *indexPath)) {
      
        self.didSelectItemAtIndexPathHandle = didSelectedHandle;
        
        return self;
    };

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if (self.numberOfSectionsInCollectionViewHandle) {
        return self.numberOfSectionsInCollectionViewHandle(collectionView);
    }
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (self.numberOfItemsInSectionHandle) {
        return self.numberOfItemsInSectionHandle(collectionView,section);
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(ZFCJointPrexfix_CV(cellClass)) forIndexPath:indexPath];
    
    if(self.cellForItemAtIndexPathHandle) {
        self.cellForItemAtIndexPathHandle(collectionView,cell, indexPath);
    }
    return cell;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.sizeForItemAtIndexPathHandle) {
        return self.sizeForItemAtIndexPathHandle(collectionView,indexPath);
    }
    return CGSizeMake((375-30)/2.0, 200);
    
   
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {

    if (self.referenceSizeForHeaderInSectionHandle)
        return self.referenceSizeForHeaderInSectionHandle(collectionView, section);

    return CGSizeZero;
   
}


- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@_header",NSStringFromClass(ZFCJointPrexfix_CV(sectionHeaderClass))] forIndexPath:indexPath];

        if (self.collectionElementKindSectionHeaderHandle) {
            self.collectionElementKindSectionHeaderHandle(collectionView,headerView,indexPath.section);
        }
        return headerView;
    }else {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@_footer",NSStringFromClass(ZFCJointPrexfix_CV(sectionFooterClass))] forIndexPath:indexPath];
        self.collectionElementKindSectionFooterHandle(collectionView,footerView,indexPath.section);

        return footerView;
    }
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        DQHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@_header",NSStringFromClass(ZFCJointPrexfix_CV(sectionHeaderClass))] forIndexPath:indexPath];
//        header.titleLab.text = @"头部第一个";
//        return header;
//
//    }else{
//        DQHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@_footer",NSStringFromClass(ZFCJointPrexfix_CV(sectionFooterClass))] forIndexPath:indexPath];
//        header.titleLab.text = @"尾部第一个";
//
//        return header;
//    }
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    if (self.referenceSizeForFooterInSectionHandle)
        return self.referenceSizeForFooterInSectionHandle(collectionView, section);
    return CGSizeZero;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.didSelectItemAtIndexPathHandle) self.didSelectItemAtIndexPathHandle(collectionView,indexPath);
    
}

- (void)zfc_reloadData {
    
    [ZFCJointPrexfix_CV(collectionView) reloadData];

}


- (void)zfc_reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
    [ZFCJointPrexfix_CV(collectionView) reloadItemsAtIndexPaths:indexPaths];
}

- (void)dealloc {
    
    NSLog(@"collectionView释放了");
    
}

@end
