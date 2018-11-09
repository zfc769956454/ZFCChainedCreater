//
//  UITableViewHeaderFooterView+ZFC_HeaderOrFooterConfigure.h
//  TakeoutTableView
//
//  Created by 富成赵 on 2018/3/25.
//  Copyright © 2018年 前海创石记（深圳）科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewHeaderFooterView (ZFC_HeaderFooterComplexConfig)

/**
 注册段头和段尾
 */
+ (void)registerTabelView:(UITableView*)tableView
                    isNib:(BOOL)isNib
      headerFooterClass:(NSString*)headerOrFooterClass;

/**
 载入数据
 */
- (void)config:(UITableViewHeaderFooterView*)headerOrFooterView
     sectionModel:(id)sectionModel
          section:(NSInteger)section;

/**
 根据数据源计算headerOrFooter高度
 */
+ (CGFloat)getHeaderOrFooterHeightWithSectionModel:(id)sectionModel
                                           section:(NSInteger)section;

@end
