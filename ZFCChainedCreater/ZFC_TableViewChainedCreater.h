//
//  ZFC_TableViewChainedCreater.h
//  ChainDeom-控件创建篇
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFC_TableViewChainedCreater : NSObject

/**frame-->要先设置frame*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^frameAndStyle)(CGRect frame,UITableViewStyle style);

/**父试图*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^addIntoView)(UIView *superView);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^tag)(NSInteger tag);

/**设置分割线和颜色*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^separatorStyleAndColor)(UITableViewCellSeparatorStyle separatorStyle,UIColor *separatorColor);

/**分割线缩进*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^separatorInset)(UIEdgeInsets separatorInset);

/**头试图*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^tableHeaderView)(UIView *tableHeaderView);

/**尾试图*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^tableFooterView)(UIView *tableFooterView);

/**垂直滚动条*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);

/**数值滚动条*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);

/**行高*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^rowHeight)(CGFloat rowHeight);

/**预估行高*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^estimatedRowHeight)(CGFloat estimatedRowHeight);

/**段头高*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^sectionHeaderHeight)(CGFloat sectionHeaderHeight);

/**段尾高*/
@property (nonatomic,copy,readonly)ZFC_TableViewChainedCreater *(^sectionFooterHeight)(CGFloat sectionFooterHeight);


@end



@interface UITableView (creater)

/**
 创建tableView
 */
+ (UITableView *)ZFC_TableViewChainedCreater:(void(^)(ZFC_TableViewChainedCreater *creater))creater;


@end


