//
//  iSuResourceManager.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/19.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "iSuResourceManager.h"

@implementation iSuResourceManager

NSBundle *iSuDefaultBundle(void){
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"iSuFunctionGuide")];
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"iSuFunctionGuide" ofType:@"bundle"];
        bundle = [NSBundle bundleWithPath:path];
    });
    return bundle;
}

@end
