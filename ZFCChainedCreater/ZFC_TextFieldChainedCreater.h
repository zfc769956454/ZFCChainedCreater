//
//  BKTextFieldChainedCreater.h
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFC_TextFieldChainedCreater : NSObject

/**父试图*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^addIntoView)(UIView *superView);

/**frame*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^frame)(CGRect frame);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**font*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^font)(UIFont *font);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^tag)(NSInteger tag);

/**text*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^text)(NSString *text);

/**borderStyle*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^borderStyle)(UITextBorderStyle borderStyle);

/**placeholder*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^placeholder)(NSString *placeholder);

/**clearsOnBeginEditing*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^clearButtonMode)(BOOL clearsOnBeginEditing);

/**keyboardType*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^keyboardType)(UIKeyboardType keyboardType);

/**圆角*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^layerCornerRadius)(CGFloat cornerRadius);

/**边线*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^layerBorderWidthAndBorderColor)(CGFloat borderWidth,UIColor * borderColor);

/**delegate*/
@property (nonatomic,copy,readonly)ZFC_TextFieldChainedCreater *(^delegate)(id<UITextFieldDelegate>  delegate);


@end




@interface UITextField (creater)

/**
 创建textField
 */
+ (UITextField *)ZFC_TextFieldChainedCreater:(void(^)(ZFC_TextFieldChainedCreater *creater))creater;

@end
