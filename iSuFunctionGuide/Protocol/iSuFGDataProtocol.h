//
//  iSuFGDataProtocol.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/21.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol iSuFGDataProtocol <NSObject>

/*
   1.为什么参考的工程 要在封装出一个子Protocol
 */

/// 自定义内部显示局域
@property (nonatomic, strong) UIView *isu_containerView;

/// 透明块显示区域
@property (nonatomic, assign) CGRect isu_functionAlphaFrame;

/// 当前视图要展示的层级
@property (nonatomic, assign) NSInteger level;

///   FIXME: 着这个属性是不是和iSuFunctionGuideDelegate中的方法有重复
@property (nonatomic, copy) dispatch_block_t completionHandle;

@end

NS_ASSUME_NONNULL_END
