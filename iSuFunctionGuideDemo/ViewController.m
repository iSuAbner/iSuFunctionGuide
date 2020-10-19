//
//  ViewController.m
//  iSuFunctionGuideDemo
//
//  Created by 巴文辉 on 2020/9/29.
//  Copyright © 2020 巴文辉. All rights reserved.
//

#import "ViewController.h"

#import "iSuGuideDisplayModel.h"

#import "iSuGuideView.h"

@interface ViewController ()

@end

@implementation ViewController

/*
    FIXME: 1.NSObject + iSuGuide 分类为测试方法 2.0.0版本应该删除掉？
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self _buttonOpertaion];
    
    [self _functionGuideOperation];
}

- (void)_buttonOpertaion{
    
    UIButton *guideOperationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    guideOperationBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, [UIScreen mainScreen].bounds.size.height - 200, 100, 50);
    guideOperationBtn.backgroundColor = [UIColor grayColor];
    guideOperationBtn.layer.cornerRadius = 10;
    guideOperationBtn.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
    [guideOperationBtn setTitle:@"添加功能引导" forState:UIControlStateNormal];
    [guideOperationBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [guideOperationBtn addTarget:self action:@selector(_functionGuideOperation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:guideOperationBtn];
}

- (void)_functionGuideOperation{
    
    iSuGuideView *functionGuideView = [[iSuGuideView alloc] initWithFrame:self.view.bounds];
    
    iSuGuideDisplayModel *displayModel1 = [[iSuGuideDisplayModel alloc] init];
    displayModel1.alphaLocation = CGRectMake(10, 136, 340, 224);
    displayModel1.explainImageName = @"functionArrow";
    displayModel1.explainLocation = CGRectMake(85, 373, 50, 50);
    displayModel1.operationImageName = @"home_guide_btn_next";
    displayModel1.operationHintLocation = CGRectMake(231, 447, 84, 42);
    [functionGuideView showInView:self.view data:displayModel1 level1CompletionHandle:^{
        NSLog(@"第一层引导完成");
    } completion:^{
        NSLog(@"功能引导结束");
    }];

    iSuGuideDisplayModel *displayModel3 = [[iSuGuideDisplayModel alloc] init];
    displayModel3.alphaLocation = CGRectMake(20, 320, 320, 148);
    displayModel3.explainImageName = @"functionArrow";
    displayModel3.explainLocation = CGRectMake(99.5, 257, 50, 50);
    displayModel3.operationImageName = @"home_guide_btn_next";
    displayModel3.operationHintLocation = CGRectMake(246, 114, 84, 42);
    [functionGuideView addOperationWith:displayModel3 level:3 completion:^{
        NSLog(@"当前界面引导完成");
    }];
    
    iSuGuideDisplayModel *displayModel4 = [[iSuGuideDisplayModel alloc] init];
    displayModel4.alphaLocation = CGRectMake(12, 88, 170, 80); 
    displayModel4.explainImageName = @"functionArrow";
    displayModel4.explainLocation = CGRectMake(12, 181, 50, 50);
    displayModel4.operationImageName = @"home_guide_btn_know";
    displayModel4.operationHintLocation = CGRectMake(245.5, 300, 95, 55);
    [functionGuideView addOperationWith:displayModel4 level:4 completion:nil];
    
    [self.view addSubview:functionGuideView];
}

@end
