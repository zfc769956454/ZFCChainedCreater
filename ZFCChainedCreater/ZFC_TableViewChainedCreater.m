//
//  ZFC_TableViewChainedCreater.m
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_TableViewChainedCreater.h"


@interface  ZFC_TableViewChainedCreater()

/**tableView*/
@property(nonatomic,strong) UITableView *chainedTableView;

@end

@implementation ZFC_TableViewChainedCreater


- (ZFC_TableViewChainedCreater *(^)(CGRect, UITableViewStyle))frameAndStyle {
    
    return ^ZFC_TableViewChainedCreater *(CGRect frame, UITableViewStyle style) {
        
        if (!self.chainedTableView) {
            
            self.chainedTableView = [[UITableView alloc] initWithFrame:frame style:style];
        }
        
        return self;
    };
    
}


- (ZFC_TableViewChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_TableViewChainedCreater *(UIView *superView) {
        
        if(superView) {
            [superView addSubview:self.chainedTableView];
        }
        
        return self;
    };
}


- (ZFC_TableViewChainedCreater *(^)(UIColor *))backgroundColor {
    
    
    return ^ZFC_TableViewChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedTableView.backgroundColor = backgroundColor;
        
        return self;
    };
    
}


- (ZFC_TableViewChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_TableViewChainedCreater *(NSInteger tag) {
        
        self.chainedTableView.tag = tag;
       
        return self;
    };
    
}



- (ZFC_TableViewChainedCreater *(^)(UITableViewCellSeparatorStyle, UIColor *))separatorStyleAndColor {
    
    return ^ZFC_TableViewChainedCreater *(UITableViewCellSeparatorStyle separatorStyle, UIColor *separatorColor) {
        
        self.chainedTableView.separatorStyle = separatorStyle;
        if (separatorStyle != UITableViewCellSeparatorStyleNone) {
            self.chainedTableView.separatorColor = separatorColor;
        }
        return self;
    };
    
}


- (ZFC_TableViewChainedCreater *(^)(UIEdgeInsets))separatorInset {
    
    return ^ZFC_TableViewChainedCreater *(UIEdgeInsets separatorInset) {
        
        self.chainedTableView.separatorInset = separatorInset;
      
        return self;
    };
}

- (ZFC_TableViewChainedCreater *(^)(UIView *))tableHeaderView {
    
    return ^ZFC_TableViewChainedCreater *(UIView *tableHeaderView) {
        
        self.chainedTableView.tableHeaderView = tableHeaderView;
       
        return self;
    };
}


- (ZFC_TableViewChainedCreater *(^)(UIView *))tableFooterView {
    
    return ^ZFC_TableViewChainedCreater *(UIView *tableFooterView) {
        
        self.chainedTableView.tableFooterView = tableFooterView;
        
        return self;
    };
}


- (ZFC_TableViewChainedCreater *(^)(BOOL))showsVerticalScrollIndicator {
    
    return ^ZFC_TableViewChainedCreater *(BOOL showsVerticalScrollIndicator) {
        
        self.chainedTableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
        
        return self;
    };
    
}


- (ZFC_TableViewChainedCreater *(^)(BOOL))showsHorizontalScrollIndicator {
    
    return ^ZFC_TableViewChainedCreater *(BOOL showsHorizontalScrollIndicator) {
        
        self.chainedTableView.showsVerticalScrollIndicator = showsHorizontalScrollIndicator;
        
        return self;
    };
}


- (ZFC_TableViewChainedCreater *(^)(CGFloat))rowHeight {
    
    return ^ZFC_TableViewChainedCreater *(CGFloat rowHeight) {
        
        self.chainedTableView.rowHeight = rowHeight;
        
        return self;
    };
}

- (ZFC_TableViewChainedCreater *(^)(CGFloat))estimatedRowHeight {
    
    return ^ZFC_TableViewChainedCreater *(CGFloat estimatedRowHeight) {
        
        self.chainedTableView.estimatedRowHeight = estimatedRowHeight;
        
        return self;
    };
}


- (ZFC_TableViewChainedCreater *(^)(CGFloat))sectionHeaderHeight {
    
    return ^ZFC_TableViewChainedCreater *(CGFloat sectionHeaderHeight) {
        
        self.chainedTableView.sectionHeaderHeight = sectionHeaderHeight;
        
        return self;
    };
    
}

- (ZFC_TableViewChainedCreater *(^)(CGFloat))sectionFooterHeight {
    
    return ^ZFC_TableViewChainedCreater *(CGFloat sectionFooterHeight) {
        
        self.chainedTableView.sectionFooterHeight = sectionFooterHeight;
        
        return self;
    };
}


@end


@implementation UITableView (creater)

+ (UITableView *)ZFC_TableViewChainedCreater:(void(^)(ZFC_TableViewChainedCreater *creater))creater;{
    
    ZFC_TableViewChainedCreater *tableViewCreater = [[ZFC_TableViewChainedCreater alloc] init];
    
    if(creater){
        creater(tableViewCreater);
    }
    
    return tableViewCreater.chainedTableView;
}

@end

