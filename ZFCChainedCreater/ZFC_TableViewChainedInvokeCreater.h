//
//  BKTableViewProtocolHelper.h
//  ChainDemo
//
//  Created by mac on 2018/8/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFC_TableViewChainedInvokeConfig.h"



@class  ZFC_TableViewChainedInvokeCreater;


/**
 tableView的配置

 @param tableViewConfig tableView的配置
 
 @return ZFC_TableViewChainedInvokeCreater
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_tableViewConfigure)(ZFC_TableViewChainedInvokeConfig *tableViewConfig);

/**
 返回section数量
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_numberOfSectionsInTableView)(NSInteger(^)(UITableView *tableView));
/**
 返回row数量
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_numberOfRowsInSection)(NSInteger(^)(UITableView *tableView,NSInteger section));
/**
 返回cell
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_cellForRowAtIndexPath)(void(^)(UITableView *tableView,__kindof UITableViewCell * cell,NSIndexPath * indexPath));
/**
 返回cell高度
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_heightForRowAtIndexPath)(CGFloat(^)(UITableView *tableView,NSIndexPath * indexPath));

/**
 返回段头高度
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_heightForHeaderInSection)(CGFloat(^)(UITableView *tableView,NSInteger section));
/**
 返回段头
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_viewForHeaderInSection)(void(^)(UITableView *tableView,__kindof UITableViewHeaderFooterView *sectionHeaderView,NSInteger section));
/**
 返回段尾高度
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_heightForFooterInSection)(CGFloat(^)(UITableView *tableView,NSInteger section));
/**
 返回段尾
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_viewForFooterInSection)(void(^)(UITableView *tableView,__kindof UITableViewHeaderFooterView *sectionFooterView,NSInteger section));

/**
 删除
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_deleteCellWithIndexPath)(void(^)(UITableView *tableView,NSIndexPath * indexPath));

/**
 点击
 */
typedef ZFC_TableViewChainedInvokeCreater *(^ZFC_didSelectRowAtIndexPath)(void(^)(UITableView *tableView,NSIndexPath * indexPath));


@interface ZFC_TableViewChainedInvokeCreater : NSObject <UITableViewDelegate,UITableViewDataSource>
/** 基本配置 */
@property (nonatomic,copy,readonly) ZFC_tableViewConfigure zfc_tableViewConfigure;

/** section数量 */
@property (nonatomic,copy,readonly) ZFC_numberOfSectionsInTableView zfc_numberOfSectionsInTableView;
/** row数量 */
@property (nonatomic,copy,readonly) ZFC_numberOfRowsInSection zfc_numberOfRowsInSection;
/** 返回cell */
@property (nonatomic,copy,readonly) ZFC_cellForRowAtIndexPath zfc_cellForRowAtIndexPath;
/** cellHeight */
@property (nonatomic,copy,readonly) ZFC_heightForRowAtIndexPath zfc_heightForRowAtIndexPath;

/** 段头高 */
@property (nonatomic,copy,readonly) ZFC_heightForHeaderInSection zfc_heightForHeaderInSection;
/** 段头view */
@property (nonatomic,copy,readonly) ZFC_viewForHeaderInSection   zfc_viewForHeaderInSection;
/** 段尾高 */
@property (nonatomic,copy,readonly) ZFC_heightForFooterInSection zfc_heightForFooterInSection;
/** 段尾view */
@property (nonatomic,copy,readonly) ZFC_viewForFooterInSection   zfc_viewForFooterInSection;

/** 删除cell */
@property (nonatomic,copy,readonly) ZFC_deleteCellWithIndexPath  zfc_deleteCellWithIndexPath;

/** selected */
@property (nonatomic,copy,readonly) ZFC_didSelectRowAtIndexPath zfc_didSelectRowAtIndexPath;

/**
 整体刷新
 */
- (void)zfc_reloadData;

/**
 刷新row
 */
- (void)zfc_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation ;

@end
