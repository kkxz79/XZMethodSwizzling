//
//  Programmer.m
//  XZMethodSwizzling
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "Programmer.h"
#import <objc/runtime.h>

@implementation Programmer
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL s1 = @selector(go);
        SEL s2 = @selector(stop);
        Class class = object_getClass((id)self);
        Method m1 = class_getClassMethod(class, s1);
        Method m2 = class_getClassMethod(class, s2);
        //如果self实现了m2方法，success是NO
        BOOL success = class_addMethod(class, s1, method_getImplementation(m2), method_getTypeEncoding(m2));
        if(success){
            class_replaceMethod(class, s2, method_getImplementation(m1), method_getTypeEncoding(m1));
        }
        else{
            method_exchangeImplementations(m1, m2);
        }
    });
}

@end
