//
//  MinDistanceStep.m
//  PathFinder
//
//  起点到终点的 最短路径步骤
//
//  Created by aliouswang on 2017/12/1.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import "MinDistanceStep.h"

@implementation MinDistanceStep

- (CGFloat) minDistance {
    return _minDistance;
}

- (NSMutableArray<Cross*> *) step {
    return _step;
}

- (void) setStep:(NSMutableArray<Cross*> *) step {
    _step = step;
}

- (void) setMinDistance:(CGFloat) minDistance {
    _minDistance = minDistance;
}

- (void) setReachable:(BOOL) reachable {
    _reachable = reachable;
}

@end
