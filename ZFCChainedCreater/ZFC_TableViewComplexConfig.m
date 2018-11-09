//
//  ZFC_NoticeMessageDelegateConfig.m
//  MontnetsLiveKing
//
//  Created by 富成赵 on 2018/3/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "ZFC_TableViewComplexConfig.h"


@interface ZFC_TableViewComplexConfig()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray  *cellIdentifiers;
@property (nonatomic, copy) NSString *headerIdetifier;
@property (nonatomic, copy) NSString *footerIdentifier;
@property (nonatomic, assign) BOOL isCellNib;
@property (nonatomic, assign) BOOL isSectionHeaderNib;
@property (nonatomic, assign) BOOL isSectionFooterNib;
@property (nonatomic, assign) BOOL isCanDelete;
@property (nonatomic, copy) TableViewCellConfigBlock cellConfigBlock;
@property (nonatomic, copy) TableViewSectionHeaderViewConfigBlock headerConfigBlock;
@property (nonatomic, copy) TableViewSectionFooterViewConfigBlock footerConfigBlock;
@property (nonatomic, copy) TableViewHeaderHeightBlock headerHeightBlock;
@property (nonatomic, copy) TableViewFooterHeightBlock footerHeightBlock;
@property (nonatomic, copy) TableViewCellDidSelectBlock cellDidSelectedBlock;
@property (nonatomic, copy)  TableViewCellDeleteBlock    cellDeleteBlock;

@end

@implementation ZFC_TableViewComplexConfig
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
             deleteBlock:(TableViewCellDeleteBlock)cellDeleteBlock
{
    if(self = [super init]){
        self.dataSource           = [NSMutableArray arrayWithArray:dataSource];
        self.sectionCount         = (sectionCount<=1)?1:sectionCount;
        self.headerIdetifier      = headerIdetifier;
        self.footerIdentifier     = footerIdentifier;
        self.isCellNib            = isCellNib;
        self.isSectionHeaderNib          = isSectionHeaderNib;
        self.isSectionFooterNib          = isSectionFooterNib;
        self.isCanDelete          = isCanDelete;
        self.cellConfigBlock  = cellConfigBlock;
        NSAssert(cellConfigBlock, @"cell配置block不能为空");
        self.headerConfigBlock= headerConfigBlock;
        self.footerConfigBlock= footerConfigBlock;
        self.headerHeightBlock    = headerHeightBlock;
        self.footerHeightBlock    = footerHeightBlock;
        self.cellDidSelectedBlock = cellDidSelectedBlock;
        self.cellDeleteBlock      = cellDeleteBlock;
    }
    return self;
}


- (id)modelFromIndexPath:(NSIndexPath *)indexPath
{
    return (self.sectionCount == 1)?self.dataSource[indexPath.row]:((ZFC_TableViewSectionSuperComplexModel *)self.dataSource[indexPath.section]).sectionArray[indexPath.row];
}

- (void)setTableViewDelegateAndDataSource:(UITableView *)tableView{
    self.tableView       = tableView;
    tableView.delegate   = self;
    tableView.dataSource = self;
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return (self.sectionCount == 1)?1:self.dataSource.count;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.sectionCount == 1)?self.dataSource.count:((ZFC_TableViewSectionSuperComplexModel *)self.dataSource[section]).sectionArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFC_TableViewRowSuperComplexModel * model = [self modelFromIndexPath:indexPath];
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id model = [self modelFromIndexPath:indexPath];
    NSString *cellIdentifier = ((ZFC_TableViewRowSuperComplexModel *)model).cellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        [UITableViewCell registerTableView:tableView isNib:self.isCellNib cellClass:cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    if(self.cellConfigBlock){
        self.cellConfigBlock(indexPath,cell,model);
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id model = [self modelFromIndexPath:indexPath];
    id cell  = [tableView cellForRowAtIndexPath:indexPath];
    
    if(self.cellDidSelectedBlock){
        self.cellDidSelectedBlock(indexPath, cell, model);
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(!self.headerIdetifier){
        return [[UIView alloc]init];
    }
    UITableViewHeaderFooterView* header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerIdetifier];
    if (!header) {
        [UITableViewHeaderFooterView registerTabelView:tableView isNib:self.isSectionHeaderNib headerFooterClass:self.headerIdetifier];
        header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerIdetifier];
    }
    if(self.headerConfigBlock){
        self.headerConfigBlock(section, header,self.dataSource[section]);
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(!self.headerIdetifier){
         return 0.0001f;
    }else{
        CGFloat headerHeight = 0.0001f;
        if(self.headerHeightBlock) {
            headerHeight = self.headerHeightBlock(section,self.dataSource[section]);
        }
        return headerHeight;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(!self.footerIdentifier){
        return [[UIView alloc]init];
    }
    UITableViewHeaderFooterView* footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.footerIdentifier];
    if (!footer) {
        [UITableViewHeaderFooterView registerTabelView:tableView isNib:self.isSectionFooterNib  headerFooterClass:self.footerIdentifier];
        footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.footerIdentifier];
    }
    
    if(self.footerConfigBlock){
        self.footerConfigBlock(section, footer,self.dataSource[section]);
    }
    return footer;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if(!self.footerIdentifier){
           return 0.0001f;
    }else{
        CGFloat footHeight = 0.0001f;
        if(self.footerHeightBlock) {
            footHeight = self.footerHeightBlock(section,self.dataSource[section]);
        }
        return footHeight;
    }
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.isCanDelete;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.sectionCount == 1 && self.dataSource.count > indexPath.row)
    {
        if(self.cellDeleteBlock){
             BOOL result = self.cellDeleteBlock(indexPath, self.dataSource[indexPath.row]);
             if(result){
                 [self.dataSource removeObjectAtIndex:indexPath.row];
                 [self deleteCellWithIndexPath:indexPath tableView:tableView];
             }else{
                 NSLog(@"删除失败");
                 [tableView reloadData];
             }
        }
    }else
    {
        ZFC_TableViewSectionSuperComplexModel *secModel = self.dataSource[indexPath.section];
        if(secModel.sectionArray.count > indexPath.row){
            if(self.cellDeleteBlock){
                BOOL result = self.cellDeleteBlock(indexPath, secModel.sectionArray[indexPath.row]);
                if(result){
                    [secModel.sectionArray removeObjectAtIndex:indexPath.row];
                    [self deleteCellWithIndexPath:indexPath tableView:tableView];
                }else{
                    NSLog(@"删除失败");
                    [tableView reloadData];
                }
            }
        }
    }
}

- (void)deleteCellWithIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [tableView endUpdates];
}


@end
