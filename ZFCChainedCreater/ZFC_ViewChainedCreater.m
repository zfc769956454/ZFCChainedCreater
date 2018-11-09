//
//  BKViewChainedCreater.m
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "ZFC_ViewChainedCreater.h"
#import <objc/message.h>



@interface ZFC_ViewChainedCreater ()

/**view */
@property(nonatomic,strong) UIView *chainedView;

@property(nonatomic,assign) BOOL    userTapTapGesture;

/** 记录tap的点击事件 ->block*/
@property(nonatomic,copy) ZFC_CreaterViewTapBlock keepTapBlock;

@end


@implementation ZFC_ViewChainedCreater


- (UIView *)chainedView{
    
    if(_chainedView == nil){
        
        _chainedView = [UIView new];
    }
    return _chainedView;
}



- (ZFC_ViewChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_ViewChainedCreater *(UIView *superView) {
        
        if(superView){
            [superView addSubview:self.chainedView];
        }
        
        return self;
    };
}


- (ZFC_ViewChainedCreater *(^)(CGRect ))frame {
    
    return ^ZFC_ViewChainedCreater *(CGRect frame) {
        
        self.chainedView.frame = frame;
        
        return self;
    };
    
}


- (ZFC_ViewChainedCreater *(^)(UIColor *))backgroundColor {
    
    return ^ZFC_ViewChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedView.backgroundColor = backgroundColor;
        
        return self;
    };
    
}

- (ZFC_ViewChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_ViewChainedCreater *(NSInteger tag) {
        
        self.chainedView.tag = tag;
        
        return self;
    };
    
}


- (ZFC_ViewChainedCreater *(^)(CGFloat))layerCornerRadius {
    
    return ^ZFC_ViewChainedCreater *(CGFloat cornerRadius) {
        
        self.chainedView.layer.cornerRadius = cornerRadius;
        self.chainedView.clipsToBounds      = YES;
        
        return self;
    };
    
}


- (ZFC_ViewChainedCreater *(^)(CGFloat, UIColor *))layerBorderWidthAndBorderColor {
    
    return ^ZFC_ViewChainedCreater *(CGFloat borderWidth, UIColor *borderColor) {
        
        self.chainedView.layer.borderWidth = borderWidth;
        self.chainedView.layer.borderColor = borderColor.CGColor;
        
        return self;
    };
}

- (ZFC_ViewChainedCreater *(^)(BOOL))isUserTapTapGesture {
    
    return ^ZFC_ViewChainedCreater *(BOOL isUserTapTapGesture) {
        
        self.userTapTapGesture = isUserTapTapGesture;
        if(isUserTapTapGesture) {
            
            [self.chainedView creater_tapBlock:^(UIView *view) {
                
                if(self.keepTapBlock){
                    self.keepTapBlock(view);
                }
                
            } view:self.chainedView];
        }
    
        return self;
    };
}


- (ZFC_ViewChainedCreater *(^)(ZFC_CreaterViewTapBlock))tapBlock {
    
    return ^ZFC_ViewChainedCreater *(ZFC_CreaterViewTapBlock tapBlock) {
    
        if(tapBlock) {
            NSAssert(self.userTapTapGesture, @"请先在外部设置isUserTapTapGesture为YES");
            self.keepTapBlock = tapBlock;
        }
        
        return self;
    };
}


@end




@implementation UIView (creater)

+(UIView *)ZFC_ViewChainedCreater:(void(^)(ZFC_ViewChainedCreater *creater))create {
    
    ZFC_ViewChainedCreater *viewCreater = [[ZFC_ViewChainedCreater alloc] init];
    
    if(create){
        create (viewCreater);
    }
    
    return viewCreater.chainedView;
}


/**
 点击手势
 */
-(void)creater_tapBlock:(ZFC_CreaterViewTapBlock)byValueBlock  view:(UIView *)view {
    
    if(byValueBlock){
        
        objc_setAssociatedObject(self, @selector(viewTap:), byValueBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [view addGestureRecognizer:tap];
    
}


- (void)viewTap:(UITapGestureRecognizer *)tap {
    
    ZFC_CreaterViewTapBlock byValueBlock = objc_getAssociatedObject(self, _cmd);
    
    if (byValueBlock) {
        
        byValueBlock(tap.view);
    }
    
}

@end
