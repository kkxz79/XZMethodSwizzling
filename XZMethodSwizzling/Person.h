//
//  Person.h
//  XZMethodSwizzling
//
//  Created by kkxz on 2018/9/20.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
//静态(类) 方法
+ (void)go;
+ (void)stop;
@end

NS_ASSUME_NONNULL_END
