//
//  Cross.m
//  PathFinder
//
//  Created by aliouswang on 2017/11/30.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import "Cross.h"

@implementation Cross

- (id) initWithId:(NSString *) crossId andPoint:(CGPoint) point {
    if (self = [super init]) {
        _crossId = crossId;
        _point = point;
        _neighborList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)crossId {
    return _crossId;
}

- (CGPoint)point {
    return _point;
}

- (NSMutableArray<Cross *> *)getNeighborList {
    return _neighborList;
}

- (void) setNeighborList:(NSMutableArray<Cross*> *) neighborList{
    _neighborList = neighborList;
}

- (void)addNeighbor:(Cross *)neighbor {
    [_neighborList addObject: neighbor];
}

- (id) copyWithZone:(NSZone *)zone {
    Cross *cross =[[[self class] alloc] initWithId:_crossId andPoint:_point];
    [cross setNeighborList:_neighborList];
    return cross;
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    }else {
        return _crossId == [other crossId];
    }
}

- (NSUInteger)hash
{
    return [_crossId hash];
}

@end
