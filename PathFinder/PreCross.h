//
//  PreCross.h
//  PathFinder
//  记录当前节点的前一个节点，以及当前节点到起点的距离
//
//  Created by aliouswang on 2017/11/30.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cross.h"

@interface PreCross : NSObject <NSCopying> {
    CGFloat _distance;
    Cross *_pre;
}

- (id) initWithDistance:(CGFloat) distance and:(Cross*) preCross;

- (CGFloat) distance;
- (Cross *) preCross;

@end
