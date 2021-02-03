//
//  iSuGuideView.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/9/29.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "iSuGuideView.h"

//View
#import "iSuGuideSubMaskView.h"

//Category
#import "NSArray+iSuFunctionGuide.h"

//Protocol
#import "iSuFGViewProtocol.h"

@interface iSuGuideView()

@property (nonatomic, copy) dispatch_block_t completionHandle;

/// 所有符合协议的子视图
@property (nonatomic, strong) NSMutableArray <id<iSuFGViewProtocol>> *guideSubViewArray;

@end

@implementation iSuGuideView

/*
  TODO: List
  1.当前最大的level为多少 如果添加的level小于当前的level 报错添加失误。 ？
  2.如果和当前的level相差的不止是1 就添加几个空视图进去  ？
  3.整体数据流传递考虑架构 还是用代理要比block好一点
  4.功能引导器有关闭按钮吗？ 应该没有吧
*/

#pragma mark - Override
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.subviews.count == 1) {
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if (self.completionHandle) {
                self.completionHandle();
            }
        }];
    }else{

        NSInteger minLevel = [[self.subviews valueForKeyPath:@"@min.level"] integerValue];
        for (iSuGuideSubMaskView *subView in self.subviews) {
            if (subView.level == minLevel) {
                [subView removeFromSuperview];
                if (subView.completionHandle) {
                    subView.completionHandle();
                }
            }
        }

        NSInteger nowLevel = [[self.subviews valueForKeyPath:@"@min.level"] integerValue];
        for (iSuGuideSubMaskView *subView in self.subviews) {
            if (subView.level == nowLevel) {
                subView.hidden = NO;
            }
        }
    }
}

#pragma mark - public

- (void)showInView:(UIView *)view data:(iSuGuideDisplayModel *)data level1CompletionHandle:(dispatch_block_t)level1CompletionHandle completion:(dispatch_block_t)completionHandle{
    
    iSuGuideSubMaskView *maskView = [[iSuGuideSubMaskView alloc] initWithModel:data];
    //self.currentLargestLevel = 1;
    maskView.level = 1;
    maskView.completionHandle = level1CompletionHandle;
    self.completionHandle = completionHandle;
    [self addSubview:maskView];
}

- (void)addOperationWith:(iSuGuideDisplayModel *)data level:(NSInteger)level completion:(dispatch_block_t)completionHandle{
    
    iSuGuideSubMaskView *maskView = [[iSuGuideSubMaskView alloc] initWithModel:data];
    //self.currentLargestLevel = level;
    maskView.level = level;
    maskView.completionHandle = completionHandle;
    maskView.hidden = YES;
    [self addSubview:maskView];
}

+ (NSString *)currentGuideVersion{
    return @"1.2.6";
}

///*************************************************************************   调整框架为protocol连接数据   *************************************************************************

- (void)show{
    [self showToView:[UIApplication sharedApplication].keyWindow];
}

- (void)showToView:(UIView *)view{
    [view addSubview:self];
    self.frame = view.bounds;
    [self build];
}

#pragma mark - private

- (void)commonInit{
    //TODO: init的初始化数据
}

- (void)build{
    
    if ([NSArray isu_isEmpty:self.dataSourceArray]) {
        NSLog(@"功能引导器数据源为空!");
        //TODO:如果数据源为空 怎么关闭引导器
    }
    
    //TODO:拆解整个dataSourceArray将对应的数据添加的View中。
    __weak typeof(self) wSelf = self;
    [wSelf.dataSourceArray enumerateObjectsUsingBlock:^(id<iSuFGDataProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        __strong typeof(wSelf) self = wSelf;
        //不对啊  id<iSuFGDataProtocol> -> id<iSuFGViewProtocol>   这个警告怎么去除啊
        //FIXME:参考框架中 数据都是以block做值的传递的 有什么优势吗
        UIView <iSuFGViewProtocol> *guideSubView = [[UIView alloc] initWithFrame:self.bounds];
        guideSubView.isu_viewData = obj;
        guideSubView.level = 1;
        if ([guideSubView respondsToSelector:@selector(drawAlphaArea)]) {
            [self drawAlphaAreaLocation:obj.isu_functionAlphaFrame inView:guideSubView];
        }
        [guideSubView addSubview:obj.isu_containerView];
        [self addSubview:guideSubView];
    }];
}

- (void)drawAlphaAreaLocation:(CGRect)alphaFrame inView:(UIView *)view{
    //透明的区域
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.847;
    [view.layer addSublayer:fillLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:alphaFrame cornerRadius:8];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    fillLayer.path = path.CGPath;
}

/// 找到最小 subView
- (id<iSuFGViewProtocol> _Nullable)findLeastLevelView{
    //FIXME:如果当前视图没有level怎么办
    if ([NSArray isu_isEmpty:self.guideSubViewArray]) {
        return nil;
    }
    NSInteger minLevel = [[self.guideSubViewArray valueForKeyPath:@"@min.level"] integerValue];
    for (id<iSuFGViewProtocol> guideSubView in self.guideSubViewArray) {
        if (guideSubView.level == minLevel) {
            return guideSubView;
        }
    }
    return nil;
}

#pragma mark - getter
- (NSMutableArray<id<iSuFGViewProtocol>> *)guideSubViewArray{
    if (!_guideSubViewArray) {
        
        
        _guideSubViewArray = [NSMutableArray array];
        __weak typeof(self) wSelf = self;
        [wSelf.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //FIXME: 这边是不用加这个weak的吗？
            __strong typeof(wSelf) self = wSelf;
            if ([obj conformsToProtocol:@protocol(iSuFGViewProtocol)]) {
                [_guideSubViewArray addObject:obj];
            }
        }];
    }
    return _guideSubViewArray;
}

@end
