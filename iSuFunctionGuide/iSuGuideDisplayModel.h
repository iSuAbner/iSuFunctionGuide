//
//  iSuGuideDisplayModel.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/9/29.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface iSuGuideDisplayModel : NSObject

// 透明区域相关
@property (nonatomic, assign) CGRect alphaLocation;

//解释详情相关
// 第一步可以先图片， 第二部在拆开 各有各的号吧 看情况
//@property (nonatomic, copy) NSString *explain;
@property (nonatomic, copy) NSString *explainImageName;
@property (nonatomic, assign) CGRect explainLocation;

//流程下一部操作相关
//@property (nonatomic, copy)  NSString* operationHint;
@property (nonatomic, copy) NSString *operationImageName;
@property (nonatomic, assign) CGRect operationHintLocation;

@end

NS_ASSUME_NONNULL_END
