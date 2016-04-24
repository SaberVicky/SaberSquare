//
//  SLBaseSquare.h
//  SaberSquareDemo
//
//  Created by songlong on 16/4/11.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLBaseSquare : NSObject


@property (nonatomic, strong) NSMutableArray *indexArray;

@property (nonatomic, assign) NSInteger maxSteps;

@property (nonatomic, strong) NSArray *checkBottomArray;
@property (nonatomic, strong) NSArray *checkLeftArray;
@property (nonatomic, strong) NSArray *checkRightArray;

@property (nonatomic, strong) NSArray *randomArray;

@property (nonatomic, assign) NSInteger currentSquareType;

- (instancetype)initWithStartIndex:(NSInteger)startIndex;
- (void)randomSquare;

@end
