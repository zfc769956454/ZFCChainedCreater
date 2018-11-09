//
//  BKImageViewChainedCreater.m
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "ZFC_ImageViewChainedCreater.h"
#import <objc/message.h>


@interface ZFC_ImageViewChainedCreater ()

/**imageView */
@property(nonatomic,strong) UIImageView *chainedImageView;

/** 记录tap的点击事件 ->block*/
@property(nonatomic,copy) ZFC_CreaterImageViewTapBlock keepTapBlock;

@end


@implementation ZFC_ImageViewChainedCreater

- (UIImageView *)chainedImageView {
    
    if(_chainedImageView == nil) {
        
        _chainedImageView = [UIImageView new];
        [_chainedImageView creater_tapBlock:^(UIImageView *imageView) {
            
            if(self.keepTapBlock) {
                self.keepTapBlock(imageView);
            }

        } imageView:_chainedImageView];
    }
    
    return _chainedImageView;
    
}


- (ZFC_ImageViewChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_ImageViewChainedCreater *(UIView *superView) {
        
        if(superView) {
            [superView addSubview:self.chainedImageView];
        }
        
        return self;
    };
    
}

- (ZFC_ImageViewChainedCreater *(^)(CGRect))frame {
    
    return ^ZFC_ImageViewChainedCreater *(CGRect frame) {
        
        self.chainedImageView.frame = frame;
        
        return self;
    };
    
}

- (ZFC_ImageViewChainedCreater *(^)(UIColor *))backgroundColor {
    
    return ^ZFC_ImageViewChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedImageView.backgroundColor = backgroundColor;
        
        return self;
    };
    
}

- (ZFC_ImageViewChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_ImageViewChainedCreater *(NSInteger tag) {
        
        self.chainedImageView.tag = tag;
        
        return self;
    };
    
}

- (ZFC_ImageViewChainedCreater *(^)(CGFloat))layerCornerRadius {
    
    return ^ZFC_ImageViewChainedCreater *(CGFloat cornerRadius) {
        
        self.chainedImageView.layer.cornerRadius = cornerRadius;
        self.chainedImageView.clipsToBounds = YES;
        
        return self;
    };
    
}

- (ZFC_ImageViewChainedCreater *(^)(UIImage *))image {
    
    return ^ZFC_ImageViewChainedCreater *(UIImage *image) {
        
        self.chainedImageView.image= image;
        
        return self;
    };
    
}


- (ZFC_ImageViewChainedCreater *(^)(UIViewContentMode))contentMode{
    
    return ^ZFC_ImageViewChainedCreater *(UIViewContentMode contentMode) {
        
        self.chainedImageView.contentMode= contentMode;
        
        return self;
    };
    
}

- (ZFC_ImageViewChainedCreater *(^)(BOOL))userInteractionEnabled {
    
    return ^ZFC_ImageViewChainedCreater *(BOOL userInteractionEnabled) {
        
        self.chainedImageView.userInteractionEnabled = userInteractionEnabled;
        
        return self;
    };
    
}


- (ZFC_ImageViewChainedCreater *(^)(CGFloat, UIColor *))layerBorderWidthAndBorderColor {
    
    return ^ZFC_ImageViewChainedCreater *(CGFloat borderWidth, UIColor *borderColor) {
        
        self.chainedImageView.layer.borderWidth = borderWidth;
        self.chainedImageView.layer.borderColor = borderColor.CGColor;
        
        return self;
    };
}


- (ZFC_ImageViewChainedCreater *(^)(ZFC_CreaterImageViewTapBlock))tapBlock {
    
    return ^ZFC_ImageViewChainedCreater *(ZFC_CreaterImageViewTapBlock tapBlock) {
        
        if(tapBlock) {
            self.chainedImageView.userInteractionEnabled = YES;
            self.keepTapBlock  = tapBlock;
        }
        
        return self;
    };
    
}

@end




@implementation UIImageView (creater)

+ (UIImageView *)ZFC_ImageViewChainedCreater:(void(^)(ZFC_ImageViewChainedCreater *creater))creater {
    
    ZFC_ImageViewChainedCreater *imageViewCreater = [[ZFC_ImageViewChainedCreater alloc] init];
    if(creater){
        creater(imageViewCreater);
    }
    
    return imageViewCreater.chainedImageView;
}

- (void)creater_tapBlock:(ZFC_CreaterImageViewTapBlock)byValueBlock  imageView:(UIImageView *)imageView{
    
    if(byValueBlock){
        
        objc_setAssociatedObject(self, @selector(imageViewTap:), byValueBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTap:)];
    
    [imageView addGestureRecognizer:tap];
    
}


- (void)imageViewTap:(UITapGestureRecognizer *)tap {
    
    ZFC_CreaterImageViewTapBlock byValueBlock = objc_getAssociatedObject(self, _cmd);
    
    if (byValueBlock) {
        
        byValueBlock((UIImageView *)tap.view);
    }
    
}


@end
