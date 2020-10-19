//
//  iSuGuideSubMaskView.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/9/29.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "iSuGuideSubMaskView.h"

//Modle
#import "iSuGuideDisplayModel.h"

@interface iSuGuideSubMaskView()

@property (nonatomic, strong) UIImageView *explainImageV;

@property (nonatomic, strong) UIImageView *operationImageV;

@property (nonatomic, strong) iSuGuideDisplayModel *model;

@end

@implementation iSuGuideSubMaskView

#pragma mark - public
- (instancetype)initWithModel:(iSuGuideDisplayModel *)displayModel{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.model = displayModel;
        [self commonInit];
    }
    return self;
}

#pragma mark - Override
- (void)layoutSubviews{
    
    [super layoutSubviews];
}

#pragma mark - private

- (void)commonInit{
    
    [self drawAlphaArea];
    
    self.explainImageV.frame = self.model.explainLocation;
    self.operationImageV.frame = self.model.operationHintLocation;
    
    [self addSubview:self.explainImageV];
    [self addSubview:self.operationImageV];
    
    self.explainImageV.image = [UIImage imageNamed:self.model.explainImageName];
    self.operationImageV.image = [UIImage imageNamed:self.model.operationImageName];
}

- (void)drawAlphaArea{
    
    //透明的区域
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.847;
    [self.layer addSublayer:fillLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:self.model.alphaLocation cornerRadius:8];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    fillLayer.path = path.CGPath;
}

#pragma mark - getter

- (UIImageView *)explainImageV{
    if (!_explainImageV) {
        _explainImageV = [UIImageView new];
    }
    return _explainImageV;
}

- (UIImageView *)operationImageV{
    if (!_operationImageV) {
        _operationImageV = [UIImageView new];
    }
    return _operationImageV;
}

@end
