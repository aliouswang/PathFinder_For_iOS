//
//  ViewController.m
//  PathFinder
//
//  Created by aliouswang on 2017/11/30.
//  Copyright © 2017年 aliouswang. All rights reserved.
//

#import "ViewController.h"
#import "DijstraPathFinder.h"

@interface ViewController () {
    id<IPathFinder> pathFinder;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    pathFinder = [DijstraPathFinder new];
    
    NSMutableArray *allCrossList = [self mockCross];
    Cross *start = [allCrossList objectAtIndex:2];
    Cross *end = [allCrossList objectAtIndex:6];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"" forKey:@"1"];
    if ([[dic allKeys] containsObject:@"1"]) {
        NSMutableDictionary *array = [dic allKeys];
        NSString *value = [dic objectForKey:@"1"];
        if (value == nil) {
            
        }
    }
    
    MinDistanceStep *minDistanceStep = [pathFinder getMinDistanceStepWithStart:start between:end from:allCrossList];
    
    if (minDistanceStep != nil) {
        
    }
}

- (NSMutableArray *) mockCross {
    NSMutableArray *crossList = [NSMutableArray new];
    Cross *start = [[Cross alloc] initWithId:@"1" andPoint:CGPointMake(120, 125)];
    Cross *c2 = [[Cross alloc] initWithId:@"2" andPoint:CGPointMake(370, 125)];
    Cross *c3 = [[Cross alloc] initWithId:@"3" andPoint:CGPointMake(680, 125)];
    Cross *c4 = [[Cross alloc] initWithId:@"4" andPoint:CGPointMake(120, 315)];
    Cross *c5 = [[Cross alloc] initWithId:@"5" andPoint:CGPointMake(370, 315)];
    Cross *c6 = [[Cross alloc] initWithId:@"6" andPoint:CGPointMake(680, 315)];
    Cross *c7 = [[Cross alloc] initWithId:@"7" andPoint:CGPointMake(120, 490)];
    Cross *c8 = [[Cross alloc] initWithId:@"8" andPoint:CGPointMake(370, 490)];
    
    [crossList addObject:start];
    [crossList addObject:c2];
    [crossList addObject:c3];
    [crossList addObject:c4];
    [crossList addObject:c5];
    [crossList addObject:c6];
    [crossList addObject:c7];
    [crossList addObject:c8];
    
    [start addNeighbor:c2];
    [start addNeighbor:c4];
    
    [c2 addNeighbor:start];
    [c2 addNeighbor:c3];
    [c2 addNeighbor:c5];
    
    [c3 addNeighbor:c2];
    
    [c4 addNeighbor:start];
    [c4 addNeighbor:c5];
    [c4 addNeighbor:c7];
    
    [c5 addNeighbor:c4];
    [c5 addNeighbor:c2];
    [c5 addNeighbor:c6];
    [c5 addNeighbor:c8];
    
    [c6 addNeighbor:c5];
    
    [c7 addNeighbor:c4];
    
    [c8 addNeighbor:c5];
    
    return crossList;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
