//
//  NSObject+iSuGuide.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/15.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "NSObject+iSuGuide.h"
#import <UIKit/UIKit.h>
#import <objc/message.h>

@implementation NSObject (iSuGuide)

- (NSString *)iSuDescription{
    
    NSString  *despStr = @"";
    Class cls = [self class];
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
        
        for (int i = 0; i < sharedVarCount; i++) {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
             /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
            id varValue = [self valueForKey:key];
            NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];
            if (varValue && [filters containsObject:key] == NO) {
                despStr = [despStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@\n", key, varValue]];
            }
         }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
    return despStr;
}

@end
