//
//  BKTableViewProtocolHelper.m
//  ChainDemo
//
//  Created by mac on 2018/8/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFC_TableViewChainedInvokeCreater.h"


#define ZFCJointPrexfix_TV(objc)  (self.tableViewConfig.objc)

@interface ZFC_TableViewChainedInvokeCreater()

/** tableView基本配置 */
@property (strong, nonatomic) ZFC_TableViewChainedInvokeConfig *tableViewConfig;

/** section数量 */
@property (nonatomic,copy)NSInteger (^numberOfSectionsInTableViewHandle)(UITableView *tableView) ;
/** row数量 */
@property (nonatomic,copy)NSInteger (^numberOfRowsInSectionHandle)(UITableView *tableView,NSInteger section) ;
/** 返回cell */
@property (nonatomic,copy)void (^cellForRowAtIndexPathHandle)(UITableView *tableView,__kindof UITableViewCell *cell, NSIndexPath *indexPath) ;
/** cellHeight */
@property (nonatomic,copy)CGFloat (^heightForRowAtIndexPathHandle )(UITableView *tableView,NSIndexPath *indexPath);

/** 段头高 */
@property (nonatomic,copy)CGFloat (^heightForHeaderInSectionHandle)(UITableView *tableView,NSInteger section) ;
/** 段头view */
@property (nonatomic,copy)void (^viewForHeaderInSectionHandle)(UITableView *tableView,UITableViewHeaderFooterView *sectionHeaderView,NSInteger section) ;
/** 段尾高 */
@property (nonatomic,copy)CGFloat (^heightForFooterInSectionHandle)(UITableView *tableView,NSInteger section) ;
/** 段尾view */
@property (nonatomic,copy)void (^viewForFooterInSectionHandle)(UITableView *tableView,UITableViewHeaderFooterView *sectionFooterView,NSInteger section) ;

/** selected */
@property (nonatomic,copy)void (^deleteCellWithIndexPathHandle)(UITableView *tableView,NSIndexPath * indexPath);

/** selected */
@property (nonatomic,copy)void (^didSelectRowAtIndexPathHandle)(UITableView *tableView,NSIndexPath *indexPath) ;

@end


@implementation ZFC_TableViewChainedInvokeCreater


#pragma mark -- getter
- (ZFC_tableViewConfigure)zfc_tableViewConfigure {
    
    return ^ZFC_TableViewChainedInvokeCreater *(ZFC_TableViewChainedInvokeConfig *tableViewConfig) {
        
        self.tableViewConfig = tableViewConfig;
        ZFCJointPrexfix_TV(tableView).delegate = self;
        ZFCJointPrexfix_TV(tableView).dataSource = self;

        NSAssert(ZFCJointPrexfix_TV(cellClass), @"请传入一个cell的类对象");
        
        ZFCJointPrexfix_TV(isCellXib) ? [ZFCJointPrexfix_TV(tableView) registerNib:[UINib nibWithNibName:NSStringFromClass(ZFCJointPrexfix_TV(cellClass)) bundle:nil] forCellReuseIdentifier:NSStringFromClass(ZFCJointPrexfix_TV(cellClass))] : [ZFCJointPrexfix_TV(tableView) registerClass:ZFCJointPrexfix_TV(cellClass) forCellReuseIdentifier:NSStringFromClass(ZFCJointPrexfix_TV(cellClass))]
        ;
        if (ZFCJointPrexfix_TV(sectionHeaderClass)) {
           
            NSAssert([[ZFCJointPrexfix_TV(sectionHeaderClass) new] isKindOfClass:[UITableViewHeaderFooterView class]], @"请传入段头对象为UITableViewHeaderFooterView的类");
            
            ZFCJointPrexfix_TV(isSectionHeaderXib) ? [ZFCJointPrexfix_TV(tableView) registerNib:[UINib nibWithNibName:NSStringFromClass(ZFCJointPrexfix_TV(sectionHeaderClass)) bundle:nil] forHeaderFooterViewReuseIdentifier:[NSString stringWithFormat:@"%@_header",NSStringFromClass(ZFCJointPrexfix_TV(sectionHeaderClass))]] : [ZFCJointPrexfix_TV(tableView) registerClass:ZFCJointPrexfix_TV(sectionHeaderClass) forHeaderFooterViewReuseIdentifier:[NSString stringWithFormat:@"%@_header",NSStringFromClass(ZFCJointPrexfix_TV(sectionHeaderClass))]];
            
        }
        if (ZFCJointPrexfix_TV(sectionFooterClass)) {
            
             NSAssert([[ZFCJointPrexfix_TV(sectionFooterClass) new] isKindOfClass:[UITableViewHeaderFooterView class]], @"请传入段尾对象为UITableViewHeaderFooterView的类");
            ZFCJointPrexfix_TV(isSectionFooterXib) ? [ZFCJointPrexfix_TV(tableView) registerNib:[UINib nibWithNibName:NSStringFromClass(ZFCJointPrexfix_TV(sectionFooterClass)) bundle:nil] forHeaderFooterViewReuseIdentifier:[NSString stringWithFormat:@"%@_footer",NSStringFromClass(ZFCJointPrexfix_TV(sectionFooterClass))]] :
             [ZFCJointPrexfix_TV(tableView) registerClass:ZFCJointPrexfix_TV(sectionFooterClass) forHeaderFooterViewReuseIdentifier:[NSString stringWithFormat:@"%@_footer",NSStringFromClass(ZFCJointPrexfix_TV(sectionFooterClass))]];
        }
        
        return self;
    };
}


- (ZFC_numberOfSectionsInTableView)zfc_numberOfSectionsInTableView {
    
    return ^ZFC_TableViewChainedInvokeCreater *(NSInteger (^sectionsHandle)(UITableView *tableView)) {
        
        self.numberOfSectionsInTableViewHandle =  sectionsHandle;
        
        return self;
    };
    
}

- (ZFC_numberOfRowsInSection)zfc_numberOfRowsInSection {
    
    return ^ZFC_TableViewChainedInvokeCreater *(NSInteger (^rowsHandle)(UITableView *tableView,NSInteger section)) {
        
        self.numberOfRowsInSectionHandle = rowsHandle;
        return self;
    };
    
}


- (ZFC_cellForRowAtIndexPath)zfc_cellForRowAtIndexPath {
    
    return ^ZFC_TableViewChainedInvokeCreater *(void (^cellForRowAtIndexPath)(UITableView *tableView,__kindof UITableViewCell *cell, NSIndexPath *indexPath)) {
        self.cellForRowAtIndexPathHandle  =  cellForRowAtIndexPath;
        
        return self;
    };
}


- (ZFC_heightForRowAtIndexPath)zfc_heightForRowAtIndexPath {
    
    return ^ZFC_TableViewChainedInvokeCreater *(CGFloat (^configCellHeightHandle)(UITableView *tableView,NSIndexPath *indexPath)) {
        self.heightForRowAtIndexPathHandle   =  configCellHeightHandle;
        return self;
    };
    
}

- (ZFC_heightForHeaderInSection)zfc_heightForHeaderInSection {
    
    NSAssert(ZFCJointPrexfix_TV(sectionHeaderClass), @"请传入一个段头的类对象");
    
    return ^ZFC_TableViewChainedInvokeCreater *(CGFloat (^heightForHeaderInSection)(UITableView *tableView,NSInteger section)) {
        
        self.heightForHeaderInSectionHandle = heightForHeaderInSection;
        
        return self;
    };
}


- (ZFC_viewForHeaderInSection)zfc_viewForHeaderInSection {
    
    NSAssert(ZFCJointPrexfix_TV(sectionHeaderClass), @"请传入一个段头的类对象");
    
    return ^ZFC_TableViewChainedInvokeCreater *(void (^viewForHeaderInSection)(UITableView *tableView,__kindof UITableViewHeaderFooterView *headerView,NSInteger section)) {
        
        self.viewForHeaderInSectionHandle = viewForHeaderInSection;
        
        return self;
    };
    
}


- (ZFC_heightForFooterInSection)zfc_heightForFooterInSection {
    
    NSAssert(ZFCJointPrexfix_TV(sectionFooterClass), @"请传入一个段尾的类对象");
    
    return ^ZFC_TableViewChainedInvokeCreater *(CGFloat (^heightForFooterInSection)(UITableView *tableView,NSInteger section)) {
        
        self.heightForFooterInSectionHandle  = heightForFooterInSection;
        
        return self;
    };
    
}

- (ZFC_viewForFooterInSection)zfc_viewForFooterInSection {
    
    NSAssert(ZFCJointPrexfix_TV(sectionFooterClass), @"请传入一个段尾的类对象");
    
    return ^ZFC_TableViewChainedInvokeCreater *(void (^viewForFooterInSection)(UITableView *tableView,__kindof UITableViewHeaderFooterView *footerView,NSInteger section)) {
        
        self.viewForFooterInSectionHandle = viewForFooterInSection;
        
        return self;
    };
    
}


- (ZFC_deleteCellWithIndexPath)zfc_deleteCellWithIndexPath {
    
    return ^ZFC_TableViewChainedInvokeCreater *(void (^deleteCellWithIndexPath)(UITableView *tableView, NSIndexPath *indexPath)) {
        
        self.deleteCellWithIndexPathHandle = deleteCellWithIndexPath;
        
        return self;
    };
    
}


- (ZFC_didSelectRowAtIndexPath)zfc_didSelectRowAtIndexPath {
    __weak typeof(self)weakSelf = self;
    return ^ZFC_TableViewChainedInvokeCreater *(void (^didSelectedHandle)(UITableView *tableView,NSIndexPath *indexPath)) {
        
        weakSelf.didSelectRowAtIndexPathHandle = didSelectedHandle ;
        return self;
        
    };
    
}



#pragma mark delegate/dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if(self.numberOfSectionsInTableViewHandle) return self.numberOfSectionsInTableViewHandle(tableView);
    
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(self.numberOfRowsInSectionHandle) return self.numberOfRowsInSectionHandle(tableView,section);
    
    return 0 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.heightForRowAtIndexPathHandle ) return self.heightForRowAtIndexPathHandle (tableView,indexPath);
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(ZFCJointPrexfix_TV(cellClass))];
    
    if(self.cellForRowAtIndexPathHandle) {
        self.cellForRowAtIndexPathHandle(tableView,cell, indexPath);
    }
    
    return cell;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (self.heightForHeaderInSectionHandle)  return self.heightForFooterInSectionHandle(tableView,section);
       
    return 0.001;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (self.viewForHeaderInSectionHandle) {
        
        UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[NSString stringWithFormat:@"%@_header",NSStringFromClass(ZFCJointPrexfix_TV(sectionHeaderClass))]];
        
        self.viewForHeaderInSectionHandle(tableView,headerView,section);
        
        return headerView;
    }
    
    return [UIView new];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (self.heightForFooterInSectionHandle) return self.heightForFooterInSectionHandle(tableView,section);
    
    return 0.001;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    
    if (self.viewForFooterInSectionHandle) {
        
        UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[NSString stringWithFormat:@"%@_footer",NSStringFromClass(ZFCJointPrexfix_TV(sectionFooterClass))]];
        self.viewForFooterInSectionHandle(tableView,footerView,section);
        
        return footerView;
    }
    
    return [UIView new];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.didSelectRowAtIndexPathHandle)  self.didSelectRowAtIndexPathHandle(tableView,indexPath);
    
}

- (void)zfc_reloadData {
    
    [ZFCJointPrexfix_TV(tableView) reloadData];
    
}

- (void)zfc_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    
    [ZFCJointPrexfix_TV(tableView) reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return ZFCJointPrexfix_TV(canDelete);
}

//移除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (self.deleteCellWithIndexPathHandle) self.deleteCellWithIndexPathHandle(tableView,indexPath);
    }
    
}



- (void)dealloc {
    
    NSLog(@"tableView释放了");
    
}

@end
