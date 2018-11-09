//
//  BKButtonChainedCreater.m
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "ZFC_ButtonChainedCreater.h"
#import <objc/message.h>


@interface ZFC_ButtonChainedCreater ()

/**button */
@property(nonatomic,strong) ZFC_CusNoHightedButton *chainedButton;

/** 记录button的点击事件 ->block*/
@property(nonatomic,copy) ZFC_CreaterButtonActionBlock keepActionBlock;

@end


@implementation ZFC_ButtonChainedCreater


- (UIButton *)chainedButton {

    if(_chainedButton == nil){
        
        _chainedButton = [ZFC_CusNoHightedButton new];
        [_chainedButton creater_actionBlock:^ (UIButton *button){
            
            if(self.keepActionBlock){
                self.keepActionBlock(button);
            }

        } controlEvent:UIControlEventTouchUpInside];
    }
    return _chainedButton ;
}



- (ZFC_ButtonChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_ButtonChainedCreater *(UIView *superView) {
        
        if(superView){
            [superView addSubview:self.chainedButton];
        }
        
        return self;
    };
}


- (ZFC_ButtonChainedCreater *(^)(CGRect ))frame {
    
    return ^ZFC_ButtonChainedCreater *(CGRect frame) {
        
        self.chainedButton.frame = frame;
        
        return self;
    };
    
}


- (ZFC_ButtonChainedCreater *(^)(UIColor *))backgroundColor {
    
    return ^ZFC_ButtonChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedButton.backgroundColor = backgroundColor;
        
        return self;
    };
    
}


- (ZFC_ButtonChainedCreater *(^)(NSString *, UIControlState))title {
    
    return ^ZFC_ButtonChainedCreater *(NSString *title ,UIControlState state) {
        
        [self.chainedButton setTitle:title forState:state];
        
        return self;
    };
    
}

- (ZFC_ButtonChainedCreater *(^)(UIImage *, UIControlState))image {
    
    return ^ZFC_ButtonChainedCreater *(UIImage  *image ,UIControlState state) {
        
        [self.chainedButton setImage:image forState:state];
        
        return self;
    };
    
}


- (ZFC_ButtonChainedCreater *(^)(UIColor *, UIControlState))titleColor{
    
    return ^ZFC_ButtonChainedCreater *(UIColor *titleColor , UIControlState state) {
        
        [self.chainedButton setTitleColor:titleColor forState:state];
        
        return self;
    };
    
}

- (ZFC_ButtonChainedCreater *(^)(UIFont *))titleLabelFont {
    
    return ^ZFC_ButtonChainedCreater *(UIFont *font) {
        
        self.chainedButton.titleLabel.font = font;
        
        return self;
    };
    
}

- (ZFC_ButtonChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_ButtonChainedCreater *(NSInteger tag) {
        
        self.chainedButton.tag = tag;
        
        return self;
    };
    
}


- (ZFC_ButtonChainedCreater *(^)(CGFloat ))layerCornerRadius {
    
    return ^ZFC_ButtonChainedCreater *(CGFloat cornerRadius) {
        
        self.chainedButton.layer.cornerRadius = cornerRadius;
        self.chainedButton.clipsToBounds      = YES;
        
        return self;
    };
    
}


- (ZFC_ButtonChainedCreater *(^)(CGFloat, UIColor *))layerBorderWidthAndBorderColor {
    
    return ^ZFC_ButtonChainedCreater *(CGFloat borderWidth, UIColor *borderColor) {
        
        self.chainedButton.layer.borderWidth = borderWidth;
        self.chainedButton.layer.borderColor = borderColor.CGColor;
        
        return self;
    };
}


- (ZFC_ButtonChainedCreater *(^)(ZFC_CreaterButtonActionBlock))actionBlock {
    
    return ^ZFC_ButtonChainedCreater *(ZFC_CreaterButtonActionBlock actionBlock) {
        
        if(actionBlock){
            self.keepActionBlock = actionBlock;
        }
        
        return self;
    };
    
}

@end



@implementation ZFC_CusNoHightedButton

- (void)setHighlighted:(BOOL)highlighted {
    
}

@end


@implementation UIButton (creater)

+ (UIButton *)ZFC_ButtonChainedCreater:(void(^)(ZFC_ButtonChainedCreater *creater))creater {
    
    ZFC_ButtonChainedCreater *buttonCreater = [[ZFC_ButtonChainedCreater alloc] init];
    if(creater){
        
        creater(buttonCreater);
    }
    return buttonCreater.chainedButton;
    
}

-(void)creater_actionBlock:(ZFC_CreaterButtonActionBlock)byValueBlock controlEvent:(UIControlEvents )event {
    
    if(byValueBlock){
        
        objc_setAssociatedObject(self, @selector(buttonClickAction:), byValueBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    [self addTarget:self action:@selector(buttonClickAction:) forControlEvents:event];
    
}



- (void)buttonClickAction:(UIButton *)button {
    
    ZFC_CreaterButtonActionBlock byValueBlock = objc_getAssociatedObject(self, _cmd);
    
    if(byValueBlock){
        byValueBlock(button);
    }
}


@end
