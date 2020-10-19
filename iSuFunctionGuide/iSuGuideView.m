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

@interface iSuGuideView()

@property (nonatomic, copy) dispatch_block_t completionHandle;

@end

@implementation iSuGuideView

/*
  TODO: List
  1.当前最大的level为多少 如果添加的level小于当前的level 报错添加失误。 ？
  2.如果和当前的level相差的不止是1 就添加几个空视图进去  ？
  3.整体数据流传递考虑架构 还是用代理要比block好一点
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

#pragma mark - private

- (void)commonInit{
    
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
    
//    if (level <= self.currentLargestLevel) {
//        NSLog(@"后续添加的%ld层指导页面有误",level);
//        return;
//    }
    
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

@end
