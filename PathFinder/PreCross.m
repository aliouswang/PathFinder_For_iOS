//
//  PreCross.m
//  PathFinder
//
//  Created by aliouswang on 2017/11/30.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import "PreCross.h"

@implementation PreCross

- (id) initWithDistance:(CGFloat) distance and:(Cross*) preCross {
    if (self = [super init]) {
        _distance = distance;
        _pre = preCross;
    }
    return self;
}

- (CGFloat) distance {
    return _distance;
}

- (Cross *) preCross {
    return _pre;
}

- (id) copyWithZone:(NSZone *)zone {
    PreCross *pre = [[[self class] alloc] initWithDistance:_distance and:_pre];
    return pre;
}

@end
