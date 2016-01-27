//
//  LLSegmentControl.m
//  LLSegmentControlDemo
//
//  Created by LiLiang on 16/1/26.
//  Copyright © 2016年 LiLiang. All rights reserved.
//

#import "LLSegmentControl.h"

@interface LLSegmentControl ()

@property (nonatomic, strong) NSArray      *items;
@property (nonatomic, strong) NSMutableArray<UIButton *> *buttons;
@property (nonatomic, strong) CAShapeLayer *indicatorLayer;
@property (nonatomic, strong) UIFont       *font;

@property (nonatomic, weak  ) CAShapeLayer *maskLayer;
@property (nonatomic, weak  ) CAShapeLayer *contentLayer;
@property (nonatomic, weak  ) CAShapeLayer *selectionLayer;

@end

@implementation LLSegmentControl

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<NSString *> *)items {
    if (self = [super initWithFrame:frame]) {
        _items = [items copy];
        
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _font = [UIFont systemFontOfSize:15];
    
    _indicatorLayer = [CAShapeLayer layer];
    [self.layer addSublayer:_indicatorLayer];
    
    CGFloat width  = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat radius = height / 2;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius*2 ];
    layer.path = bezierPath.CGPath;
    self.layer.mask = layer;
    self.maskLayer = layer;
    
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.path = bezierPath.CGPath;
    layer1.strokeColor = [UIColor whiteColor].CGColor;
    layer1.strokeStart = 0;
    layer1.strokeEnd = 1;
//    layer1.fillColor = [UIColor colorWithRed:0.87 green:0.19 blue:0.19 alpha:1].CGColor;
    layer1.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:layer1];
    self.contentLayer = layer1;
    
    
    CGFloat btnWidth = width / self.items.count;
    
    CAShapeLayer *selectionLayer = [CAShapeLayer layer];
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, btnWidth, height) cornerRadius:radius*2];
    selectionLayer.path = bezierPath1.CGPath;
    selectionLayer.fillColor = [UIColor whiteColor].CGColor;
    selectionLayer.frame = CGRectMake(0, 0, btnWidth, height);
    [self.layer addSublayer:selectionLayer];
    self.selectionLayer = selectionLayer;
    
    for (NSInteger i = 0; i < self.items.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:self.items[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0.88 green:0.18 blue:0.16 alpha:1] forState:UIControlStateSelected];
        button.titleLabel.font = self.font;
        button.frame = CGRectMake(btnWidth * i, 0, btnWidth, height);
        [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttons addObject:button];
        
        if (i == 0) {
            [self btnClicked:button];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self layoutCustomeViews];
}

#pragma mark - PublicMethod
- (NSUInteger)numberOfSegments {
    return self.items.count;
}

#pragma mark - PrivateMethod
- (void)layoutCustomeViews {
    CGFloat width  = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat btnWidth = width / self.buttons.count;
    CGFloat radius = height / 2;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius*2 ];
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, btnWidth, height) cornerRadius:radius*2];
    
    self.maskLayer.frame = self.bounds;
    self.contentLayer.frame = self.bounds;
    self.selectionLayer.frame = CGRectMake(self.selectedSegmentIndex * btnWidth, 0, btnWidth, height);
    
    self.maskLayer.path = bezierPath.CGPath;
    self.contentLayer.path = bezierPath.CGPath;
    self.selectionLayer.path = bezierPath1.CGPath;
    
    for (NSInteger i = 0; i < self.buttons.count; i++) {
        UIButton *button = self.buttons[i];
        button.frame = CGRectMake(btnWidth * i, 0, btnWidth, height);
    }
    
    
}

- (UIButton *)buttonAtIndex:(NSUInteger)segment {
    if (self.items.count > 0 && segment < [self buttons].count) {
        return (UIButton *)[[self buttons] objectAtIndex:segment];
    }
    return nil;
}

- (UIButton *)selectedButton {
    if (self.selectedSegmentIndex >= 0) {
        return [self buttonAtIndex:self.selectedSegmentIndex];
    }
    return nil;
}

#pragma mark - EventResponse
- (void)btnClicked:(UIButton *)button {
    for (UIButton *btn in self.buttons) {
        btn.selected = NO;
    }
    button.selected = YES;
    NSUInteger index = [self.buttons indexOfObject:button];
    CGFloat width  = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat btnWidth = width / self.buttons.count;
    
    self.selectedSegmentIndex = index;
    self.selectionLayer.frame = CGRectMake(self.selectedSegmentIndex * btnWidth, 0, btnWidth, height);
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


#pragma mark - Getter
- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = @[].mutableCopy;
    }
    return _buttons;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
