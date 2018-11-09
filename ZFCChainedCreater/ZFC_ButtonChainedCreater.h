//
//  BKButtonChainedCreater.h
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZFC_CreaterButtonActionBlock)(UIButton *button);


@interface ZFC_ButtonChainedCreater : NSObject

/**父试图*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^addIntoView)(UIView *superView);

/**frame*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^frame)(CGRect frame);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**标题*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^title)(NSString *title ,UIControlState state);

/**image*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^image)(UIImage *image ,UIControlState state);

/**标题颜色*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^titleColor)(UIColor *titleColor , UIControlState state);

/**文字大小*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^titleLabelFont)(UIFont *font);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^tag)(NSInteger tag);

/**圆角*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^layerCornerRadius)(CGFloat cornerRadius);

/**边线*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^layerBorderWidthAndBorderColor)(CGFloat borderWidth,UIColor * borderColor);

/**点击事件*/
@property (nonatomic,copy,readonly)ZFC_ButtonChainedCreater *(^actionBlock)(ZFC_CreaterButtonActionBlock actionBlock);

@end


@interface ZFC_CusNoHightedButton : UIButton

@end


@interface UIButton (creater)

/**
创建button
 */
+ (UIButton *)ZFC_ButtonChainedCreater:(void(^)(ZFC_ButtonChainedCreater *creater))creater;


/**
点击事件转化成block
 */
-(void)creater_actionBlock:(ZFC_CreaterButtonActionBlock)byValueBlock controlEvent:(UIControlEvents )event;


@end


