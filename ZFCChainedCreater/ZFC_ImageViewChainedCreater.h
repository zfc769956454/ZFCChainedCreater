//
//  BKImageViewChainedCreater.h
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^ZFC_CreaterImageViewTapBlock)(UIImageView *imageView);

@interface ZFC_ImageViewChainedCreater : NSObject

/**父试图*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^addIntoView)(UIView *superView);

/**frame*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^frame)(CGRect frame);

/**背景颜色*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^backgroundColor)(UIColor *backgroundColor);

/**tag*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^tag)(NSInteger tag);

/**圆角*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^layerCornerRadius)(CGFloat cornerRadius);

/**image*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^image)(UIImage *image);

/**contentMode*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^contentMode)(UIViewContentMode contentMode);

/**userInteractionEnabled*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^userInteractionEnabled)(BOOL userInteractionEnabled);

/**边线*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^layerBorderWidthAndBorderColor)(CGFloat borderWidth,UIColor * borderColor);

/**tap*/
@property (nonatomic,copy,readonly)ZFC_ImageViewChainedCreater *(^tapBlock)(ZFC_CreaterImageViewTapBlock tapBlock);


@end



@interface UIImageView(creater)


/**
 创建imageView
 */
+ (UIImageView *)ZFC_ImageViewChainedCreater:(void(^)(ZFC_ImageViewChainedCreater *creater))creater;

/**
 点击手势
 */
- (void)creater_tapBlock:(ZFC_CreaterImageViewTapBlock)byValueBlock  imageView:(UIImageView *)imageView;


@end



