//
//  ZFC_NoticeMessageDelegateConfig.h
//  MontnetsLiveKing
//
//  Created by 富成赵 on 2018/3/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFC_TableViewRowSuperComplexModel.h"
#import "ZFC_TableViewSectionSuperComplexModel.h"
#import "UITableViewCell+ZFC_CellComplexConfig.h"
#import "UITableViewHeaderFooterView+ZFC_HeaderFooterComplexConfig.h"

/** cell配置 */
typedef void (^TableViewCellConfigBlock)(NSIndexPath *indexPath,__kindof UITableViewCell *cell,id model);

/** 段头配置 */
typedef void (^TableViewSectionHeaderViewConfigBlock)(NSInteger section,__kindof UITableViewHeaderFooterView *SectionHeaderView,id model);
/** 段尾配置 */
typedef void (^TableViewSectionFooterViewConfigBlock)(NSInteger section,__kindof UITableViewHeaderFooterView *footerView,id model);
/** 段头高度 */
typedef CGFloat (^TableViewHeaderHeightBlock)(NSInteger section, id secModel);
/** 段尾配置 */
typedef CGFloat (^TableViewFooterHeightBlock)(NSInteger section, id secModel);

/** cell点击 */
typedef void (^TableViewCellDidSelectBlock)(NSIndexPath *indexPath,id cell,id model);
/** cell删除 */
typedef BOOL (^TableViewCellDeleteBlock)(NSIndexPath *indexPath,id model);




@interface ZFC_TableViewComplexConfig : NSObject<UITableViewDelegate,UITableViewDataSource>
/** 数据源 */
@property (nonatomic, strong)  NSMutableArray   *dataSource;
/** 多少段 如果分段大于1段，填大于1的数字,1段就设为1 */
@property (nonatomic, assign) NSInteger sectionCount;

/**
 初始化配置
 @param dataSource              数据源
 @param sectionCount            多少段
 @param headerIdetifier         段头标识(传入类名相同的字符串)
 @param footerIdentifier        段头标识(传入类名相同的字符串)
 @param isCellNib               cell是否Nib
 @param isSectionHeaderNib             header是否Nib
 @param isSectionFooterNib             footer是否Nib
 @param cellConfigBlock         cell配置block
 @param headerConfigBlock       段头配置block
 @param footerConfigBlock       段尾配置block
 @param headerHeightBlock       段头高度block
 @param footerHeightBlock       段尾高度block
 @param cellDidSelectedBlock    cell点击block
 */
- (id)initWithDataSource:(NSArray *)dataSource
                sections:(NSInteger)sectionCount
        headerIdentifier:(NSString *)headerIdetifier
        footerIdentifier:(NSString *)footerIdentifier
               isCellNib:(BOOL)isCellNib
             isSectionHeaderNib:(BOOL)isSectionHeaderNib
             isSectionFooterNib:(BOOL)isSectionFooterNib
             isCanDelete:(BOOL)isCanDelete
      configCellBlock:(TableViewCellConfigBlock)cellConfigBlock
configSectionHeaderViewBlock:(TableViewSectionHeaderViewConfigBlock)headerConfigBlock
configSectionFooterViewBlock:(TableViewSectionFooterViewConfigBlock)footerConfigBlock
       headerHeightBlock:(TableViewHeaderHeightBlock)headerHeightBlock
       footerHeightBlock:(TableViewFooterHeightBlock)footerHeightBlock
          didSelectBlock:(TableViewCellDidSelectBlock)cellDidSelectedBlock
             deleteBlock:(TableViewCellDeleteBlock)cellDeleteBlock;


/**
 设置代理
 */
- (void)setTableViewDelegateAndDataSource:(UITableView *)tableView;
/**
取数据
 */
- (id)modelFromIndexPath:(NSIndexPath *)indexPath;

@end
