//
//  UITableViewCell+ZFC_CellConfigure.h
//  MontnetsLiveKing
//
//  Created by 富成赵 on 2018/3/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (ZFC_CellComplexConfig)

/**
 注册cell
 @param cellClass cell类
 */
+ (void)registerTableView:(UITableView *)tableView
                    isNib:(BOOL)isNib
                cellClass:(NSString *)cellClass;
/**
 载入数据
 */
- (void)config:(UITableViewCell *)cell
        cellModel:(id)model
        indexPath:(NSIndexPath *)indexPath;


@end
