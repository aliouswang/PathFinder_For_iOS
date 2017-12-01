//
//  MinDistanceStep.h
//  PathFinder
//
//  Created by aliouswang on 2017/12/1.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cross.h"

@interface MinDistanceStep : NSObject {
    BOOL _reachable;
    CGFloat _minDistance;
    NSMutableArray<Cross*> *_step;
}

- (CGFloat) minDistance;
- (NSMutableArray<Cross*> *) step;
- (void) setStep:(NSMutableArray<Cross*> *) step;

- (void) setMinDistance:(CGFloat) minDistance;
- (void) setReachable:(BOOL) reachable;

@end
