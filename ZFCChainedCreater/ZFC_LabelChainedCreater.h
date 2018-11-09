//
//  BKLabelChainedCreater.h
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^ZFC_CreaterLabelTapBlock)(UILabel *label);


@interface ZFC_LabelChainedCreater : NSObject

/**父试图*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^addIntoView)(UIView *superView);

/**frame*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^frame)(CGRect frame);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**text*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^text)(NSString *text);

/**textColor*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^textColor)(UIColor *textColor);

/**font*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^font)(UIFont *font);

/**textAlignment*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^textAlignment)(NSTextAlignment textAlignment);

/**numberOfLines*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^numberOfLines)(NSInteger numberOfLines);

/**lineBreakMode*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^lineBreakMode)(NSLineBreakMode lineBreakMode);

/** userInteractionEnabled->默认NO */
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^userInteractionEnabled)(BOOL userInteractionEnabled);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^tag)(NSInteger tag);

/**圆角*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^layerCornerRadius)(CGFloat cornerRadius);

/**边线*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^layerBorderWidthAndBorderColor)(CGFloat borderWidth,UIColor * borderColor);

/**tap*/
@property (nonatomic,copy,readonly)ZFC_LabelChainedCreater *(^tapBlock)(ZFC_CreaterLabelTapBlock tapBlock);

@end





@interface UILabel (creater)

/**
 创建button
 */
+ (UILabel *)ZFC_LabelChainedCreater:(void(^)(ZFC_LabelChainedCreater *creater))creater;

/**
 点击手势
 */
-(void)creater_tapBlock:(ZFC_CreaterLabelTapBlock)byValueBlock  label:(UILabel *)label;

@end
