//
//  BKTextFieldChainedCreater.m
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "ZFC_TextFieldChainedCreater.h"
#import <objc/message.h>


@interface ZFC_TextFieldChainedCreater()

/**textField */
@property (strong, nonatomic) UITextField *chainedTextField ;

@end

@implementation ZFC_TextFieldChainedCreater


- (UITextField *)chainedTextField {
    
    if(_chainedTextField == nil) {
        _chainedTextField = [UITextField new];
    }
    return _chainedTextField;
}



- (ZFC_TextFieldChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_TextFieldChainedCreater *(UIView *superView) {
        
        if(superView) {
            [superView addSubview:self.chainedTextField];
        }
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(CGRect))frame {
    
    return ^ZFC_TextFieldChainedCreater *(CGRect frame) {
        
        self.chainedTextField.frame = frame;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(UIColor *))backgroundColor {
    
    return ^ZFC_TextFieldChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedTextField.backgroundColor = backgroundColor;
        
        return self;
    };
    
}

- (ZFC_TextFieldChainedCreater *(^)(UIFont *))font {
    
    return ^ZFC_TextFieldChainedCreater *(UIFont *font) {
        
        self.chainedTextField.font = font;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_TextFieldChainedCreater *(NSInteger tag) {
        
        self.chainedTextField.tag = tag;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(NSString *))text {
    
    return ^ZFC_TextFieldChainedCreater *(NSString *text) {
        
        self.chainedTextField.text = text;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(UITextBorderStyle))borderStyle {
    
    return ^ZFC_TextFieldChainedCreater *(UITextBorderStyle borderStyle) {
        
        self.chainedTextField.borderStyle = borderStyle;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(NSString *))placeholder {
    
    return ^ZFC_TextFieldChainedCreater *(NSString *placeholder) {
        
        self.chainedTextField.placeholder = placeholder;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(BOOL))clearButtonMode {
    
    return ^ZFC_TextFieldChainedCreater *(BOOL clearsOnBeginEditing) {
        
        self.chainedTextField.clearButtonMode = clearsOnBeginEditing;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(CGFloat))layerCornerRadius {
    
    return ^ZFC_TextFieldChainedCreater *(CGFloat layerCornerRadius) {
        
        self.chainedTextField.layer.cornerRadius = layerCornerRadius;
        self.chainedTextField.clipsToBounds      = YES;
        
        return self;
    };
    
}

- (ZFC_TextFieldChainedCreater *(^)(UIKeyboardType))keyboardType {
    
    return ^ZFC_TextFieldChainedCreater *(UIKeyboardType keyboardType) {
        
        self.chainedTextField.keyboardType = keyboardType;
        
        return self;
    };
}

- (ZFC_TextFieldChainedCreater *(^)(CGFloat, UIColor *))layerBorderWidthAndBorderColor {
    
    return ^ZFC_TextFieldChainedCreater *(CGFloat borderWidth, UIColor *borderColor) {
        
        self.chainedTextField.layer.borderWidth = borderWidth;
        self.chainedTextField.layer.borderColor = borderColor.CGColor;
        
        return self;
    };
}


- (ZFC_TextFieldChainedCreater *(^)(id<UITextFieldDelegate>))delegate {
    
    return ^ZFC_TextFieldChainedCreater *(id<UITextFieldDelegate>delegate) {
        
        self.chainedTextField.delegate = delegate;
        
        return self;
    };
}



@end


@implementation UITextField (creater)

+ (UITextField *)ZFC_TextFieldChainedCreater:(void(^)(ZFC_TextFieldChainedCreater *creater))creater{
    
    ZFC_TextFieldChainedCreater *textFieldCreater = [[ZFC_TextFieldChainedCreater alloc] init];

    if(creater) {
        creater(textFieldCreater);
    }
    
    return textFieldCreater.chainedTextField;
}

@end
