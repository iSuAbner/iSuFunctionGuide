//
//  iSuFunctionGuideDataSource.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/21.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iSuFGDataProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol iSuFunctionGuideDataSource <NSObject>

@required

/// 返回数据源数量
/// @param guideView  功能引导器
/// @return 数量

- (NSInteger)isu_numberOfCellsInFunctionGuide:(iSuGuideView *)guideView;


/// 返回当前下标对应的数据
/// @param functionGuide 功能引导器
/// @param index 当前下标
/// @return 数据

- (id<iSuFGDataProtocol>)isu_functionGuide:(iSuGuideView *)functionGuide dataForCellAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
