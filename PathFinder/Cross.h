//
//  Cross.h
//  PathFinder
//
//  路径中的节点，可以理解为路的交叉点
//
//  Created by aliouswang on 2017/11/30.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Cross : NSObject <NSCopying> {
    NSString *_crossId;
    CGPoint _point;
    NSMutableArray<Cross*> *_neighborList;
    
}

- (id) initWithId:(NSString *) crossId andPoint:(CGPoint) point;

- (NSString *) crossId;
- (CGPoint) point;
- (NSMutableArray<Cross *> *) getNeighborList;
- (void) addNeighbor:(Cross *) neighbor;

- (void) setNeighborList:(NSMutableArray<Cross*> *) neighborList;

@end
