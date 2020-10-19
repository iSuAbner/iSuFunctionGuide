//
//  UIImage+iSuFunctionGuide.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/19.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (iSuFunctionGuide)

///  获取bundle图片便利构造方法
/// @param name 图片名字
/// @param bundle 资源对象
+ (instancetype)isu_imageNamed:(NSString *)name bundle:(NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
