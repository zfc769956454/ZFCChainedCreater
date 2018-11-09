//
//  UICollectionView+BKProtocolConfigure.m
//  ChainDemo
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UICollectionView+ZFCChainedInvokeCreater.h"
#import <objc/message.h>

@implementation UICollectionView (BKProtocolConfigure)


- (void)configure: (void(^)(ZFC_CollectionViewChainnedInvokeCreater * helper))configuration {
    
    ZFC_CollectionViewChainnedInvokeCreater *creater = [ZFC_CollectionViewChainnedInvokeCreater new];
    if(configuration) {
        configuration(creater);
    }
    self.creater = creater;
}

#pragma mark --property
- (void)setCreater:(ZFC_CollectionViewChainnedInvokeCreater *)creater {
    
    objc_setAssociatedObject(self, @selector(creater), creater, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZFC_CollectionViewChainnedInvokeCreater *)creater {
    
    return objc_getAssociatedObject(self, _cmd);
    
}

@end
