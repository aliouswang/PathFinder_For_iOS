//
//  Util.m
//  PathFinder
//
//  Created by aliouswang on 2017/12/1.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (CGFloat) add:(CGFloat) f1 and:(CGFloat) f2 {
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f1]];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f2]];
    NSDecimalNumber *result = [num1 decimalNumberByAdding:num2];
    return result.floatValue;
}

+ (CGFloat) sub:(CGFloat) f1 and:(CGFloat) f2 {
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f1]];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f2]];
    NSDecimalNumber *result = [num1 decimalNumberBySubtracting:num2];
    return result.floatValue;
}

+ (CGFloat) mul:(CGFloat) f1 and:(CGFloat) f2 {
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f1]];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f2]];
    NSDecimalNumber *result = [num1 decimalNumberByMultiplyingBy:num2];
    return result.floatValue;
}

+ (CGFloat) div:(CGFloat) f1 and:(CGFloat) f2 {
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f1]];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:[self floatToString:f2]];
    NSDecimalNumber *result = [num1 decimalNumberByDividingBy:num2];
    return result.floatValue;
}

+ (NSString *)floatToString:(CGFloat) f {
    return [NSString stringWithFormat:@"%f", f];
}

+ (CGFloat) calculateDistance:(Cross *) start and:(Cross *) end {
    CGFloat x = [self sub:[end point].x  and:[start point].x];
    CGFloat y = [self sub:[end point].y  and:[start point].y];
    return sqrt([self add:pow(x, 2) and:pow(y, 2)]);
}

@end
