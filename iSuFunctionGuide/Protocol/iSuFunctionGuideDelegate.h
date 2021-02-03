//
//  iSuFunctionGuideDelegate.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/21.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iSuFGDataProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class iSuGuideView;

@protocol iSuFunctionGuideDelegate <NSObject>

/*
    FIXME:
    1.所以这个第几个层级的信息 是否应该展示在接口中
 */

/// 响应点击操作
/// @param guideView 功能引导器
/// @param data 数据
- (void)isu_functionGuide:(iSuGuideView *)guideView respondsToClickWithData:(id<iSuFGDataProtocol>)data;

@end

NS_ASSUME_NONNULL_END
