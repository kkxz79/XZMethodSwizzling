//
//  XZSwizzlingViewController.m
//  XZMethodSwizzling
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "XZSwizzlingViewController.h"
#import "NSArray+XZArray.h"
#import "Programmer.h"

@interface XZSwizzlingViewController ()

@end

@implementation XZSwizzlingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"黑魔法";
    self.view.backgroundColor = [UIColor whiteColor];
   
    //测试代码
    NSArray *array = @[@0,@1,@2,@3];
    [array objectAtIndex:3];
    [array objectAtIndex:4];
    
    [Person go];
    [Person stop];
    NSLog(@"------");
    [Programmer go];
    [Programmer stop];
    
}


@end
