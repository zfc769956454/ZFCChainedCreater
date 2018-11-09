//
//  UITableView+BKProtocolConfigure.m
//  ChainDemo
//
//  Created by mac on 2018/8/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UITableView+ZFC_ChainedInvokeCreater.h"
#import <objc/message.h>


@implementation UITableView (BKProtocolConfigure)

- (void)configure: (void(^)(ZFC_TableViewChainedInvokeCreater * helper))configuration {
    
    ZFC_TableViewChainedInvokeCreater *creater = [ZFC_TableViewChainedInvokeCreater new];
    if(configuration) {
        configuration(creater);
    }
    self.creater = creater;
}

#pragma mark --property
- (void)setCreater:(ZFC_TableViewChainedInvokeCreater *)creater {
    
     objc_setAssociatedObject(self, @selector(creater), creater, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZFC_TableViewChainedInvokeCreater *)creater {
    
    return objc_getAssociatedObject(self, _cmd);

}

@end
