//
//  iSuGuideSubMaskView.h
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/9/29.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class iSuGuideDisplayModel;

NS_ASSUME_NONNULL_BEGIN

@interface iSuGuideSubMaskView : UIView

@property (nonatomic, assign) NSInteger level;
@property (nonatomic, copy) dispatch_block_t completionHandle;

- (instancetype)initWithModel:(iSuGuideDisplayModel *)displayModel;

@end

NS_ASSUME_NONNULL_END
