//
//  BKViewChainedCreater.h
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZFC_CreaterViewTapBlock)(UIView *view);

@interface ZFC_ViewChainedCreater : NSObject

/**父试图*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^addIntoView)(UIView *superView);

/**frame*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^frame)(CGRect frame);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^tag)(NSInteger tag);

/**圆角*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^layerCornerRadius)(CGFloat cornerRadius);

/**边线*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^layerBorderWidthAndBorderColor)(CGFloat borderWidth,UIColor * borderColor);

/**是否使用点击手势*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^isUserTapTapGesture)(BOOL isUserTapTapGesture);

/**tap-->使用tap时候要先设置isUserTapTapGesture为YES*/
@property (nonatomic,copy,readonly)ZFC_ViewChainedCreater *(^tapBlock)(ZFC_CreaterViewTapBlock tapBlock);

@end

@interface UIView (creater)

/**
 创建view
 */
+(UIView *)ZFC_ViewChainedCreater:(void(^)(ZFC_ViewChainedCreater *creater))create;

/**
 点击手势
 */
-(void)creater_tapBlock:(ZFC_CreaterViewTapBlock)byValueBlock  view:(UIView *)view;

@end
