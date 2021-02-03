//
//  UIImage+iSuFunctionGuide.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/19.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "UIImage+iSuFunctionGuide.h"
#import <UIKit/UIKit.h>

@implementation UIImage (iSuFunctionGuide)

/*
  TODOList:
  1.isu_imageNamed bundle 方法的scale选择优化
 */

+ (instancetype)isu_imageNamed:(NSString *)name bundle:(NSBundle *)bundle{
    
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return nil;
    
    //NSString *imgname = name.stringByDeletingPathExtension;
    NSString *ext     = name.pathExtension;
    NSString *path    = nil;
    
    NSArray *commonExts = @[@"", @"png", @"jpeg", @"jpg", @"gif", @"webp", @"apng"];
    NSArray *exts = ext.length > 0?@[ext]:commonExts;
    for (NSString *e in exts) {
        path = [bundle pathForResource:name ofType:e];
        if (path) break;
    }
    if (path.length == 0) {
        return [self imageNamed:name];
    }
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data.length == 0) return nil;
    
    return [[self alloc] initWithData:data scale:1];
}

@end
