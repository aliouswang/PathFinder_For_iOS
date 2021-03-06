//
//  DijstraPathFinder.m
//  PathFinder
//
//  Created by aliouswang on 2017/12/1.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import "DijstraPathFinder.h"
#import "PreCross.h"
#import "Util.h"

@implementation DijstraPathFinder {
    Cross *_startCross;
    Cross *_endCross;
    NSUInteger _crossCount;
    NSMutableArray<Cross *> *_allCrossList;
    NSMutableSet *_outCrossSet;
    NSMutableDictionary *_fromStartDisMap;
    NSMutableArray<Cross *> *_nextCrossList;
}

//
// 初始化参与计算的参数
//
- (void) initParams {
    _outCrossSet = [NSMutableSet new];
    _fromStartDisMap = [NSMutableDictionary new];
    _nextCrossList = [NSMutableArray new];
    [_nextCrossList addObject:_startCross];
}

//
// 获得start和end 之间的最短路径，如果有多条最短路径，默认只会保存最先加入的一条。
//
- (MinDistanceStep *) getMinDistanceStepWithStart:(Cross *)start between:(Cross *)end from:(NSMutableArray<Cross *> *)allCrossList {
    _startCross = start;
    _endCross = end;
    _allCrossList = allCrossList;
    _crossCount = [_allCrossList count];
    [self initParams];
    [self step];
    if ([_fromStartDisMap.allKeys containsObject:[end crossId]]) {
        return [self changeToMinStep];
    }
    return nil;
}

//
// 根据fromStartDisMap中保存的所有其他点到起点的最短路径，注意这里的最短路径中返回的Cross节点是逆序的，
//
- (MinDistanceStep*) changeToMinStep {
    MinDistanceStep *minDistanceStep = [MinDistanceStep new];
    [minDistanceStep setMinDistance:[[_fromStartDisMap objectForKey:[_endCross crossId]] distance]];
    [minDistanceStep setReachable:TRUE];
    NSMutableArray *stepList = [NSMutableArray new];
    [minDistanceStep setStep:stepList];
    
    [stepList addObject:_endCross];
    Cross *temp = _endCross;
    while ([_fromStartDisMap.allKeys containsObject:[temp crossId]]) {
        Cross *pre = [[_fromStartDisMap objectForKey:[temp crossId]] preCross];
        [stepList addObject:pre];
        temp = pre;
    }
    return minDistanceStep;
}

- (void) step {
    if (_nextCrossList == nil || _nextCrossList.count < 1) {
        return;
    }
    if (_outCrossSet.count >= _crossCount) {
        return;
    }
    
    //获取第一个计算cross
    Cross *start = [_nextCrossList objectAtIndex:0];
    [_nextCrossList removeObject:start];
    CGFloat step = 0.0;
    if ([[_fromStartDisMap allKeys] containsObject:[start crossId]]) {
        step = [[_fromStartDisMap objectForKey:[start crossId]] distance];
        
    }
    
    NSMutableArray<Cross*> *canReachCrossList = [start getNeighborList];
    for (int i = 0; i < canReachCrossList.count; i++) {
        Cross *neighbor = [canReachCrossList objectAtIndex:i];
        //如果起点到起点，略过
        if (neighbor == _startCross) {
            continue;
        }
        
        CGFloat totalStep = [Util add:step and:[Util calculateDistance:start and:neighbor]];
        
        if ((![_nextCrossList containsObject:neighbor]) && (![_outCrossSet containsObject:neighbor])) {
            [_nextCrossList addObject:neighbor];
        }
        //检查更新最短路径
        if ([_fromStartDisMap.allKeys containsObject:[neighbor crossId]]) {
            if (totalStep < [[_fromStartDisMap objectForKey:[neighbor crossId]] distance]) {
                PreCross *preCross = [[PreCross new] initWithDistance:totalStep and:start];
                [_fromStartDisMap setObject:preCross forKey:[neighbor crossId]];
            }
        }else {
            PreCross *preCross = [[PreCross new] initWithDistance:totalStep and:start];
            [_fromStartDisMap setObject:preCross forKey:[neighbor crossId]];
        }
        [_outCrossSet addObject:start];
        [self step];
    }
}

@end
