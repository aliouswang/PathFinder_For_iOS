//
//  Util.h
//  PathFinder
//
//  浮点数精确计算工具类
//
//  Created by aliouswang on 2017/12/1.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cross.h"

@interface Util : NSObject

+ (CGFloat) add:(CGFloat) f1 and:(CGFloat) f2;
+ (CGFloat) sub:(CGFloat) f1 and:(CGFloat) f2;
+ (CGFloat) mul:(CGFloat) f1 and:(CGFloat) f2;
+ (CGFloat) div:(CGFloat) f1 and:(CGFloat) f2;

+ (CGFloat) calculateDistance:(Cross *) start and:(Cross *) end;

@end
