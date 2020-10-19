//
//  iSuGuideView.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/9/29.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class iSuGuideDisplayModel;

NS_ASSUME_NONNULL_BEGIN

@interface iSuGuideView : UIView

/// 初始化第一层级的功能引导
/// @param view 父视图
/// @param data 数据
- (void)showInView:(UIView *)view data:(iSuGuideDisplayModel *)data level1CompletionHandle:(dispatch_block_t _Nullable)level1CompletionHandle completion:(dispatch_block_t _Nullable)completionHandle;

/// 后续添加的更多指引
/// @param data 数据源
/// @param level 层级
- (void)addOperationWith:(iSuGuideDisplayModel *)data level:(NSInteger)level completion:(dispatch_block_t _Nullable)completionHandle;

// TODO: 填写当前功能引导代码对应的版本号 控制是否在当前版本显示
/// 当前功能引导代码对应版本
+ (NSString *)currentGuideVersion;

@end

NS_ASSUME_NONNULL_END
