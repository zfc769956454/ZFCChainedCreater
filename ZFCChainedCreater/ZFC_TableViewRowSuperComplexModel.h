//
//  ZFC_TableViewRowSuperModel.h
//  MontnetsLiveKing
//
//  Created by 富成赵 on 2018/3/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFC_TableViewRowSuperComplexModel : NSObject

/** cell标识(传入类名相同的字符串) */
@property (nonatomic, copy)   NSString *cellIdentifier;
@property (nonatomic, assign) CGFloat   cellHeight;
@end
