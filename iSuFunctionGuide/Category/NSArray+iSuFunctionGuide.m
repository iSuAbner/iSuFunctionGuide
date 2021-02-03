//
//  NSArray+iSuFunctionGuide.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/21.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "NSArray+iSuFunctionGuide.h"
#import "NSObject+iSuFunctionGuide.h"

@implementation NSArray (iSuFunctionGuide)

+ (BOOL)isu_isEmpty:(NSArray *)array{
    if (![NSObject isu_isKindOfArray:array]) {
        return YES;
    }
    if (array.count == 0) {
        return YES;
    }
    return NO;
}

@end
