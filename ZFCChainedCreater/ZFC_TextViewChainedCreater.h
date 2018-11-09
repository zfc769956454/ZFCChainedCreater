//
//  BKTextViewChainedCreater.h
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFC_TextViewChainedCreater : NSObject


/**父试图*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^addIntoView)(UIView *superView);

/**frame*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^frame)(CGRect frame);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^tag)(NSInteger tag);

/**font*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^font)(UIFont *font);

/**text*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^text)(NSString *text);

/**placeholder*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^placeholder)(NSString *placeholder);

/**keyboardType*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^keyboardType)(UIKeyboardType keyboardType);

/**边线*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^layerBorderWidthAndBorderColor)(CGFloat borderWidth,UIColor * borderColor);

/**keyboardType*/
@property (nonatomic,copy,readonly)ZFC_TextViewChainedCreater *(^delegate)(id<UITextViewDelegate>  delegate);


@end


@interface UITextView (creater)

/**
 创建textView
 */
+ (UITextView *)ZFC_TextViewChainedCreater:(void(^)(ZFC_TextViewChainedCreater *creater))creater;

@end


@interface UITextView (placeholder)

/** 注意先设置textView的字体 */
@property (nonatomic, copy  ) NSString *placeholder;
@property (nonatomic, strong) UILabel *placeholderLabel;

@end

