//
//  ZFC_CollectionChainedCreater.m
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_CollectionChainedCreater.h"

#define SystemVersion [[UIDevice currentDevice] systemVersion].floatValue

@interface  ZFC_CollectionChainedCreater()

/**tableView*/
@property(nonatomic,strong) UICollectionView *chainedCollectionView;

/**tableView*/
@property(nonatomic,strong) UICollectionViewFlowLayout *layout;

@end

@implementation ZFC_CollectionChainedCreater


- (UICollectionViewFlowLayout *)layout {
    
    if(_layout == nil) {
        
        _layout = [UICollectionViewFlowLayout new];
    }
    return _layout;
}


- (ZFC_CollectionChainedCreater *(^)(CGFloat))layout_minimumLineSpacing {
    
    return ^ZFC_CollectionChainedCreater *(CGFloat minimumLineSpacing) {
        
        self.layout.minimumLineSpacing = minimumLineSpacing;
        
        return self;
    };

}

- (ZFC_CollectionChainedCreater *(^)(CGFloat))layout_minimumInteritemSpacing {
    
    return ^ZFC_CollectionChainedCreater *(CGFloat minimumInteritemSpacing) {
        
        self.layout.minimumLineSpacing = minimumInteritemSpacing;
        
        return self;
    };
    
}

- (ZFC_CollectionChainedCreater *(^)(CGSize))layout_itemSize {
    
    return ^ZFC_CollectionChainedCreater *(CGSize itemSize) {
        
        self.layout.itemSize = itemSize;
        
        return self;
    };
    
}

- (ZFC_CollectionChainedCreater *(^)(CGSize))layout_estimatedItemSize {
    
    return ^ZFC_CollectionChainedCreater *(CGSize estimatedItemSize) {
        
        self.layout.itemSize = estimatedItemSize;
        
        return self;
    };
    
}


- (ZFC_CollectionChainedCreater *(^)(UICollectionViewScrollDirection))layout_scrollDirection {
    
    return ^ZFC_CollectionChainedCreater *(UICollectionViewScrollDirection scrollDirection) {
        
        self.layout.scrollDirection = scrollDirection;
        
        return self;
    };
    
}

- (ZFC_CollectionChainedCreater *(^)(CGSize))layout_headerReferenceSize {
    
    return ^ZFC_CollectionChainedCreater *(CGSize headerReferenceSize) {
        
        self.layout.headerReferenceSize = headerReferenceSize;
        
        return self;
    };
    
}


- (ZFC_CollectionChainedCreater *(^)(CGSize))layout_footerReferenceSize {
    
    return ^ZFC_CollectionChainedCreater *(CGSize footerReferenceSize) {
        
        self.layout.footerReferenceSize = footerReferenceSize;
        
        return self;
    };
    
}



- (ZFC_CollectionChainedCreater *(^)(BOOL))layout_sectionHeadersPinToVisibleBounds {
    
    return ^ZFC_CollectionChainedCreater *(BOOL layout_sectionHeadersPinToVisibleBounds) {
        
        if (@available(iOS 9.0, *)) {
            self.layout.sectionHeadersPinToVisibleBounds = layout_sectionHeadersPinToVisibleBounds;
        } else {
            //TODO:添加自定的实现
        }
        return self;
    };
    
}

- (ZFC_CollectionChainedCreater *(^)(BOOL))layout_sectionFootersPinToVisibleBounds {
    
    return ^ZFC_CollectionChainedCreater *(BOOL layout_sectionFootersPinToVisibleBounds) {
        
        if (@available(iOS 9.0, *)) {
            self.layout.sectionFootersPinToVisibleBounds = layout_sectionFootersPinToVisibleBounds;
        } else {
            //TODO:添加自定的实现
        }
        return self;
    };
    
}



- (ZFC_CollectionChainedCreater *(^)(CGRect))frame {
    
    return ^ZFC_CollectionChainedCreater *(CGRect frame) {
        
        if(!self.chainedCollectionView) {
            self.chainedCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.layout];
        }
        
        return self;
    };
    
}



- (ZFC_CollectionChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_CollectionChainedCreater *(UIView *superView) {
        
        if(superView) {
            [superView addSubview:self.chainedCollectionView];
        }
        
        return self;
    };
}


- (ZFC_CollectionChainedCreater *(^)(UIColor *))backgroundColor {
    
    
    return ^ZFC_CollectionChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedCollectionView.backgroundColor = backgroundColor;
        
        return self;
    };
    
}


- (ZFC_CollectionChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_CollectionChainedCreater *(NSInteger tag) {
        
        self.chainedCollectionView.tag = tag;
        
        return self;
    };
    
}



@end



@implementation UICollectionView (creater)

+ (UICollectionView *)ZFC_CollectionViewChainedCreater:(void(^)(ZFC_CollectionChainedCreater *creater))creater;{
    
    ZFC_CollectionChainedCreater *collectionCreater = [[ZFC_CollectionChainedCreater alloc] init];
    
    if(creater){
        creater(collectionCreater);
    }
    
    return collectionCreater.chainedCollectionView;
}

@end
