//
//  NSObject+iSuFunctionGuide.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/21.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "NSObject+iSuFunctionGuide.h"

@implementation NSObject (iSuFunctionGuide)

+ (BOOL)isu_isKindOfArray:(id _Nullable)object{
    if (object != nil && ![object isKindOfClass:[NSNull class]] && [object isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}

@end
