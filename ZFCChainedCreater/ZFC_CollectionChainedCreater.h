//
//  ZFC_CollectionChainedCreater.h
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFC_CollectionChainedCreater : NSObject

/**minimumLineSpacing*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_minimumLineSpacing)(CGFloat minimumLineSpacing);

/**minimumInteritemSpacing*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_minimumInteritemSpacing)(CGFloat minimumInteritemSpacing);

/**itemSize*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_itemSize)(CGSize itemSize);

/**estimatedItemSize*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_estimatedItemSize)(CGSize estimatedItemSize);

/**scrollDirection*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_scrollDirection)(UICollectionViewScrollDirection scrollDirection);

/**headerReferenceSize*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_headerReferenceSize)(CGSize headerReferenceSize);

/**footerReferenceSize*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_footerReferenceSize)(CGSize footerReferenceSize);


/**sectionHeadersPinToVisibleBounds --- iOS9以上*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_sectionHeadersPinToVisibleBounds)(BOOL sectionHeadersPinToVisibleBounds);

/**sectionFootersPinToVisibleBounds --- iOS9以上*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^layout_sectionFootersPinToVisibleBounds)(BOOL sectionFootersPinToVisibleBounds);


/**frame*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^frame)(CGRect frame);

/**父试图*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^addIntoView)(UIView *superView);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_CollectionChainedCreater *(^tag)(NSInteger tag);


@end




@interface UICollectionView (creater)

/**
 创建tableView
 */
+ (UICollectionView *)ZFC_CollectionViewChainedCreater:(void(^)(ZFC_CollectionChainedCreater *creater))creater;


@end
