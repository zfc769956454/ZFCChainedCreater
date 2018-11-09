//
//  ZFC_TableViewConfig.h
//  ChainDemo
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZFC_TableViewChainedInvokeConfig : NSObject

/**tableView */
@property (nonatomic,weak) UITableView *tableView;
/** cellClass */
@property (nonatomic,strong)Class cellClass ;
/** 是否用xib创建的cell --> 注意:如果是xib注册的，默认的xib名字要和cell的类名一样 */
@property (nonatomic,assign)BOOL  isCellXib;
/** sectionHeaderClass */
@property (nonatomic,strong)Class sectionHeaderClass ;
/** 是否用xib创建的sectionHeader -->
 注意:如果是xib注册的，默认的xib名字要和sectionHeader的类名一样
 友情提示：自定义UITableViewHeaderFooterView连线的时候,要勾选自定义的class,默认是File's Owner,不然会崩溃
 */
@property (nonatomic,assign)BOOL  isSectionHeaderXib ;
/** sectionFooterClass */
@property (nonatomic,strong)Class sectionFooterClass ;
/** 是否用xib创建的sectionFooter -->
 注意:如果是xib注册的，默认的xib名字要和sectionHeader的类名一样
 友情提示：自定义UITableViewHeaderFooterView连线的时候,要勾选自定义的class,默认是File's Owner,不然会崩溃
 */
@property (nonatomic,assign)BOOL  isSectionFooterXib;
/** 是否可以删除cell */
@property (nonatomic,assign)BOOL canDelete;


@end


