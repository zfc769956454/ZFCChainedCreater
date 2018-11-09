//
//  UITableViewHeaderFooterView+ZFC_HeaderOrFooterConfigure.m
//  TakeoutTableView
//
//  Created by 富成赵 on 2018/3/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "UITableViewHeaderFooterView+ZFC_HeaderFooterComplexConfig.h"

@implementation UITableViewHeaderFooterView (ZFC_HeaderFooterComplexConfig)
+ (void)registerTabelView:(UITableView*)tableView
                    isNib:(BOOL)isNib
      headerFooterClass:(NSString*)headerOrFooterClass
{
    if(isNib){
        [tableView registerNib:[UINib nibWithNibName:headerOrFooterClass bundle:nil] forHeaderFooterViewReuseIdentifier:headerOrFooterClass];
    }else{
        [tableView registerClass:[NSClassFromString(headerOrFooterClass) class] forHeaderFooterViewReuseIdentifier:headerOrFooterClass];
    }
}

- (void)config:(UITableViewHeaderFooterView*)headerOrFooterView
     sectionModel:(id)sectionModel
          section:(NSInteger)section
{

}

+ (CGFloat)getHeaderOrFooterHeightWithSectionModel:(id)sectionModel
                                           section:(NSInteger)section
{
    return 0.f;
}


@end
