//
//  SLSquareI.m
//  SaberSquareDemo
//
//  Created by songlong on 16/4/11.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLSquareI.h"

@implementation SLSquareI
- (instancetype)initWithStartIndex:(NSInteger)startIndex {
    if (self = [super initWithStartIndex:startIndex]) {
        self.indexArray = @[@(startIndex), @(startIndex + 10), @(startIndex + 20),  @(startIndex + 30)].mutableCopy;
        self.maxSteps = 16;
        self.checkBottomArray = @[@3];
        self.checkLeftArray = @[@0, @1, @2, @3];
        self.checkRightArray = @[@0, @1, @2, @3];
        self.currentSquareType = 0;
    }
    return self;
}

- (void)randomSquare {
    NSInteger startIndex = [self.indexArray[0] integerValue];
    
    if (self.currentSquareType == 0) {
        self.indexArray = @[@(startIndex), @(startIndex + 1), @(startIndex + 2),  @(startIndex + 3)].mutableCopy;
        self.maxSteps = 19;
        self.checkBottomArray = @[@0, @1, @2, @3];
        self.checkLeftArray = @[@0];
        self.checkRightArray = @[@3];
        self.currentSquareType = 1;
    } else {
        self.indexArray = @[@(startIndex), @(startIndex + 10), @(startIndex + 20),  @(startIndex + 30)].mutableCopy;
        self.maxSteps = 16;
        self.checkBottomArray = @[@3];
        self.checkLeftArray = @[@0, @1, @2, @3];
        self.checkRightArray = @[@0, @1, @2, @3];
        self.currentSquareType = 0;
    }
    
}
@end
