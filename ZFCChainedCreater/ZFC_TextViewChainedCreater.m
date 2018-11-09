//
//  BKTextViewChainedCreater.m
//  MontnetsLiveKing
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 facebac.com. All rights reserved.
//

#import "ZFC_TextViewChainedCreater.h"
#import <objc/message.h>


#define LEFT_MARGIN 4
#define TOP_MARGIN  7


@interface ZFC_TextViewChainedCreater()

/**textView */
@property (strong, nonatomic) UITextView *chainedTextView ;

@end

@implementation ZFC_TextViewChainedCreater

- (UITextView *)chainedTextView {
    
    if(_chainedTextView == nil) {
        
        _chainedTextView = [UITextView new];
    }
    return _chainedTextView;
}


- (ZFC_TextViewChainedCreater *(^)(UIView *))addIntoView {
    
    return ^ZFC_TextViewChainedCreater *(UIView *superView) {
        
        if(superView) {
            [superView addSubview:self.chainedTextView];
        }
        
        return self;
    };
}

- (ZFC_TextViewChainedCreater *(^)(CGRect))frame {
    
    return ^ZFC_TextViewChainedCreater *(CGRect frame) {
        
        self.chainedTextView.frame = frame;
        
        return self;
    };
}

- (ZFC_TextViewChainedCreater *(^)(UIColor *))backgroundColor {
    
    return ^ZFC_TextViewChainedCreater *(UIColor *backgroundColor) {
        
        self.chainedTextView.backgroundColor = backgroundColor;
        
        return self;
    };
    
}

- (ZFC_TextViewChainedCreater *(^)(NSInteger))tag {
    
    return ^ZFC_TextViewChainedCreater *(NSInteger tag) {
        
        self.chainedTextView.tag = tag;
        
        return self;
    };
}

- (ZFC_TextViewChainedCreater *(^)(UIFont *))font {
    
    return ^ZFC_TextViewChainedCreater *(UIFont *font) {
        
        self.chainedTextView.font = font;
        
        return self;
    };
}


- (ZFC_TextViewChainedCreater *(^)(NSString *))text {
    
    return ^ZFC_TextViewChainedCreater *(NSString *text) {
        
        self.chainedTextView.text = text;
        
        return self;
    };
}


- (ZFC_TextViewChainedCreater *(^)(NSString *))placeholder {

    return ^ZFC_TextViewChainedCreater *(NSString *placeholder) {

        self.chainedTextView.placeholder = placeholder;

        return self;
    };
}


- (ZFC_TextViewChainedCreater *(^)(UIKeyboardType))keyboardType {
    
    return ^ZFC_TextViewChainedCreater *(UIKeyboardType keyboardType) {
        
        self.chainedTextView.keyboardType = keyboardType;
        
        return self;
    };
}

- (ZFC_TextViewChainedCreater *(^)(CGFloat, UIColor *))layerBorderWidthAndBorderColor {
    
    return ^ZFC_TextViewChainedCreater *(CGFloat borderWidth, UIColor *borderColor) {
        
        self.chainedTextView.layer.borderWidth = borderWidth;
        self.chainedTextView.layer.borderColor = borderColor.CGColor;
        
        return self;
    };
}

- (ZFC_TextViewChainedCreater *(^)(id<UITextViewDelegate>))delegate {
    
    return ^ZFC_TextViewChainedCreater *(id<UITextViewDelegate>delegate) {
        
        self.chainedTextView.delegate = delegate;
        
        return self;
    };
}




@end


@implementation UITextView (creater)

+ (UITextView *)ZFC_TextViewChainedCreater:(void(^)(ZFC_TextViewChainedCreater *creater))creater {
    
    ZFC_TextViewChainedCreater *textViewCreater = [[ZFC_TextViewChainedCreater alloc] init];
    
    if(creater) {
        creater(textViewCreater);
    }
    
    return textViewCreater.chainedTextView;
}

@end


@implementation UITextView (placeholder)

- (NSString *)placeholder{
    return self.placeholderLabel.text;
}

- (void)setPlaceholder:(NSString *)placeholder{
    
    self.placeholderLabel.text = placeholder;
    [self changeLabelFrame];
    if (self.text == nil || [self.text isEqualToString:@""]) {
        self.placeholderLabel.hidden = NO;
    }else{
        self.placeholderLabel.hidden = YES;
    }
    if ([self.text isEqualToString:@""]) {
        self.placeholderLabel.hidden = NO;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}



- (void)textDidChange:(NSNotification *)notify{
    self.placeholderLabel.hidden = self.text.length;
}

- (UILabel *)placeholderLabel {
    UILabel *placeholderLabel =  objc_getAssociatedObject(self, @selector(placeholderLabel));
    if (placeholderLabel == nil) {
        placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.frame = self.bounds;
        placeholderLabel.font = self.font;
        placeholderLabel.textColor = [UIColor lightGrayColor];
        placeholderLabel.textAlignment = NSTextAlignmentLeft;
        placeholderLabel.numberOfLines = 0;
        [self addSubview:placeholderLabel];
        [self setPlaceholderLabel:placeholderLabel];
    }
    return placeholderLabel;
}

- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
    objc_setAssociatedObject(self, @selector(placeholderLabel), placeholderLabel, OBJC_ASSOCIATION_RETAIN);
}


- (void)changeLabelFrame{
   
    CGSize size = CGSizeMake(self.bounds.size.width, CGFLOAT_MAX);
    CGSize labelSize = [self.placeholder boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size;
    self.placeholderLabel.frame = CGRectMake(LEFT_MARGIN, TOP_MARGIN, labelSize.width, labelSize.height);
    self.placeholderLabel.hidden = NO;
    [self.placeholderLabel setText:self.placeholder];
}


@end

