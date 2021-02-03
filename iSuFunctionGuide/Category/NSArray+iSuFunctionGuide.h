//
//  NSArray+iSuFunctionGuide.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/21.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (iSuFunctionGuide)

/// 检验数组是否为空
/// @param array 待检验的数组
+ (BOOL)isu_isEmpty:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
