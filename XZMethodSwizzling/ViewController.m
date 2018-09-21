//
//  ViewController.m
//  XZMethodSwizzling
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "ViewController.h"
#import "XZSwizzlingViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithTitle:@"swizzling" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem = barButton;
    
    //Method Swizzling 本质上就是对IMP和SEL进行交换。
    //Method Swizzling是发生在运行时的，主要用于在运行时将两个Method进行交换。
    //Method Swizzling 也是iOS中面向切面编程(AOP)的一种实现方式。
    
    //OC语言的runtimee特性中，调用一个对象的方法就是给这个对象发送消息。是通过查找接收消息对象的方法列表。从列表中查找对应的SEL，这个SEL对应一个IMP（一个IMP可以对应多个SEL），通过这个IMP（函数指针）找到对应的方法调用。
    
    //每个类中都有一个Dispatch Table,本质是将类中的SEL和IMP进行对应，而Method Swizzling就是对这个table进行操作，让SEL对应另一个IMP。
    
    /*
     我们先给UIViewController添加一个Category，然后在Category中的+(void)load方法中添加Method Swizzling方法，我们用来替换的方法也写在这个Category中。由于load类方法是程序运行时这个类被加载到内存中就调用的一个方法，执行比较早，并且不需要我们手动调用。而且这个方法具有唯一性，也就是只会被调用一次，不用担心资源抢夺的问题。
     */
    
}

-(void)rightButtonAction
{
    XZSwizzlingViewController * swizzlingVC = [[XZSwizzlingViewController alloc] init];
    [self.navigationController pushViewController:swizzlingVC animated:YES];
}


@end
