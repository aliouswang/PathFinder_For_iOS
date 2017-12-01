//
//  IPathFinder.h
//  PathFinder
//
//  Created by aliouswang on 2017/12/1.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cross.h"
#import "MinDistanceStep.h"

@protocol IPathFinder <NSObject>

@required
- (MinDistanceStep *) getMinDistanceStepWithStart:(Cross *) start between:(Cross *) end from:(NSMutableArray<Cross*> *) allCrossList;


@end
