//
//  iSuFGViewProtocol.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/10/21.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iSuFGDataProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/*
     TODO: 1.这个协议符合了iSuFGDataProtocol 还要有一个符合iSuFGDataProtocol的对象
           2.协议具有能力 绘制透明区域，
*/

@protocol iSuFGViewProtocol <iSuFGDataProtocol>

///
@property (nonatomic, strong) id<iSuFGDataProtocol> isu_viewData;

- (void)drawAlphaArea;

@end

NS_ASSUME_NONNULL_END
