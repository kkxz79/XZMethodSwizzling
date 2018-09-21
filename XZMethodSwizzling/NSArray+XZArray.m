//
//  NSArray+XZArray.m
//  XZMethodSwizzling
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "NSArray+XZArray.h"
#import <objc/runtime.h>

/**
 在iOS中NSNumber、NSArray、NSDictionary等这些类都是类簇，一个NSArray的实现可能由多个类组成。
 所以如果想对NSArray进行Swizzling，必须获取到其“真身”进行Swizzling，直接对NSArray进行操作是无效的。
 
 下面列举了NSArray和NSDictionary本类的类名，可以通过Runtime函数取出本类。
 NSArray                __NSArrayI
 NSMutableArray         __NSArrayM
 NSDictionary           __NSDictionaryI
 NSMutableDictionary    __NSDictionaryM
 */

@implementation NSArray (XZArray)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
        Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(xz_objectAtIndex:));
        method_exchangeImplementations(fromMethod, toMethod);
    });
}

-(id)xz_objectAtIndex:(NSUInteger)index
{
    if(self.count<=0){
        return nil;
    }
    else{
        if(self.count-1<index){
            @try {
                return [self xz_objectAtIndex:index];
            }
            @catch (NSException *exception) {
                // 在崩溃后会打印崩溃信息。如果是线上，可以在这里将崩溃信息发送到服务器
                 NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
                 NSLog(@"%@", [exception callStackSymbols]);
                 return nil;
            }
            @finally {
                //
            }
        }
        else{
            //如果没有问题，则正常进行方法调用
            return [self xz_objectAtIndex:index];
        }
    }
}


@end
