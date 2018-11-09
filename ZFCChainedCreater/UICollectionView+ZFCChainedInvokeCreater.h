//
//  UICollectionView+BKProtocolConfigure.h
//  ChainDemo
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFC_CollectionViewChainnedInvokeCreater.h"



@interface UICollectionView (BKProtocolConfigure)

/**helper属性，作为属性强行持有方法中的help,防止提前释放*/
@property (strong, nonatomic) ZFC_CollectionViewChainnedInvokeCreater *creater;

/**
 配置方法
 */
- (void)configure: (void(^)(ZFC_CollectionViewChainnedInvokeCreater * creater))configuration;

@end


