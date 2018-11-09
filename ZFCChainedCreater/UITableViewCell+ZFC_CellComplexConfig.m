//
//  UITableViewCell+ZFC_CellConfigure.m
//  MontnetsLiveKing
//
//  Created by 富成赵 on 2018/3/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "UITableViewCell+ZFC_CellComplexConfig.h"

@implementation UITableViewCell (ZFC_CellComplexConfig)

+ (void)registerTableView:(UITableView *)tableView
                    isNib:(BOOL)isNib
                cellClass:(NSString *)cellClass
{
    if(isNib){
        [tableView registerNib:[UINib nibWithNibName:cellClass bundle:nil] forCellReuseIdentifier:cellClass];
    }else{
        [tableView registerClass:[NSClassFromString(cellClass) class] forCellReuseIdentifier:cellClass];
    }
}

- (void)config:(UITableViewCell *)cell
        cellModel:(id)model
        indexPath:(NSIndexPath *)indexPath
{
    
}


@end
