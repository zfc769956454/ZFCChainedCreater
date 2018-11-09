//
//  BKLabelChainedCreater.m
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "ZFC_LabelChainedCreater.h"
#import <objc/message.h>

@interface ZFC_LabelChainedCreater()

/**label */
@property(nonatomic,strong) UILabel *chainedLabel;

/** 记录tap的点击事件 ->block*/
@property(nonatomic,copy) ZFC_CreaterLabelTapBlock keepTapBlock;

@end

@implementation ZFC_LabelChainedCreater

- (UILabel *)chainedLabel {
    
    if(_chainedLabel == nil){
        _chainedLabel = [UILabel new];
        [_chainedLabel creater_tapBlock:^(UILabel *label) {
            
            if(self.keepTapBlock) {
                self.keepTapBlock(label);
            }
            
        } label:_chainedLabel];
    }
    
    return _chainedLabel;
}


- (ZFC_LabelChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_LabelChainedCreater *(UIView *superView) {
        
        if(superView) {
            [superView addSubview:self.chainedLabel];
        }
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(CGRect))frame {
    
    return ^ZFC_LabelChainedCreater *(CGRect frame) {
        
        self.chainedLabel.frame = frame;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(UIColor *))backgroundColor {
    
    return ^ZFC_LabelChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedLabel.backgroundColor = backgroundColor;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(NSString *))text {
    
    return ^ZFC_LabelChainedCreater *(NSString *text) {
        
        self.chainedLabel.text = text;
        
        return self;
    };
    
}

- (ZFC_LabelChainedCreater *(^)(UIColor *))textColor {
    
    return ^ZFC_LabelChainedCreater *(UIColor *textColor) {
        
        self.chainedLabel.textColor = textColor;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(UIFont *))font {
    
    return ^ZFC_LabelChainedCreater *(UIFont *font) {
        
        self.chainedLabel.font = font;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(NSTextAlignment))textAlignment {
    
    return ^ZFC_LabelChainedCreater *(NSTextAlignment textAlignment) {
        
        self.chainedLabel.textAlignment = textAlignment;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(NSInteger))numberOfLines {
    
    return ^ZFC_LabelChainedCreater *(NSInteger numberOfLines) {
        
        self.chainedLabel.numberOfLines = numberOfLines;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(NSLineBreakMode))lineBreakMode {
    
    return ^ZFC_LabelChainedCreater *(NSLineBreakMode lineBreakMode) {
        
        self.chainedLabel.lineBreakMode = lineBreakMode;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(BOOL))userInteractionEnabled {
    
    return ^ZFC_LabelChainedCreater *(BOOL userInteractionEnabled) {
        
        self.chainedLabel.userInteractionEnabled = userInteractionEnabled;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_LabelChainedCreater *(NSInteger tag) {
        
        self.chainedLabel.tag = tag;
        
        return self;
    };
    
}


- (ZFC_LabelChainedCreater *(^)(CGFloat))layerCornerRadius {
    
    return ^ZFC_LabelChainedCreater *(CGFloat cornerRadius) {
        
        self.chainedLabel.layer.cornerRadius = cornerRadius;
        self.chainedLabel.clipsToBounds      = YES;
        
        return self;
    };
    
}



- (ZFC_LabelChainedCreater *(^)(CGFloat, UIColor *))layerBorderWidthAndBorderColor {
    
    return ^ZFC_LabelChainedCreater *(CGFloat borderWidth, UIColor *borderColor) {
        
        self.chainedLabel.layer.borderWidth = borderWidth;
        self.chainedLabel.layer.borderColor = borderColor.CGColor;
      
        return self;
    };
}

- (ZFC_LabelChainedCreater *(^)(ZFC_CreaterLabelTapBlock))tapBlock {
    
    return ^ZFC_LabelChainedCreater *(ZFC_CreaterLabelTapBlock tapBlock) {
        
        if(tapBlock) {
            self.chainedLabel.userInteractionEnabled = YES;
            self.keepTapBlock  = tapBlock;
        }
        
        return self;
    };
    
}

@end




@implementation UILabel (creater)

+ (UILabel *)ZFC_LabelChainedCreater:(void(^)(ZFC_LabelChainedCreater *creater))creater {
    
    ZFC_LabelChainedCreater *labelCreater = [[ZFC_LabelChainedCreater alloc] init];
    if(creater){
        creater(labelCreater);
    }
    
    return labelCreater.chainedLabel;
}

- (void)creater_tapBlock:(ZFC_CreaterLabelTapBlock)byValueBlock  label:(UILabel *)label{
    
    if(byValueBlock){
        
        objc_setAssociatedObject(self, @selector(labelTap:), byValueBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
    
    [label addGestureRecognizer:tap];
    
}


- (void)labelTap:(UITapGestureRecognizer *)tap {
    
    ZFC_CreaterLabelTapBlock byValueBlock = objc_getAssociatedObject(self, _cmd);
    
    if (byValueBlock) {
        
        byValueBlock((UILabel *)tap.view);
    }
    
}

@end
