//
//  SLSquareS.m
//  SaberSquareDemo
//
//  Created by songlong on 16/4/11.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLSquareS.h"

@implementation SLSquareS
- (instancetype)initWithStartIndex:(NSInteger)startIndex {
    if (self = [super initWithStartIndex:startIndex]) {
        self.indexArray = @[@(startIndex), @(startIndex + 10), @(startIndex + 11),  @(startIndex + 21)].mutableCopy;
        self.maxSteps = 17;
        self.checkBottomArray = @[@1, @3];
        self.checkLeftArray = @[@0, @1, @3];
        self.checkRightArray = @[@0, @2, @3];
        self.currentSquareType = 0;
    }
    return self;
}

- (void)randomSquare {
    NSInteger startIndex = [self.indexArray[0] integerValue];
    if (self.currentSquareType == 0) {
        self.indexArray = @[@(startIndex + 10), @(startIndex + 11), @(startIndex + 1),  @(startIndex + 2)].mutableCopy;
        self.maxSteps = 18;
        self.checkBottomArray = @[@0, @1, @3];
        self.checkLeftArray = @[@0, @2];
        self.checkRightArray = @[@1, @3];
        self.currentSquareType = 1;
    } else if (self.currentSquareType == 1) {
        self.indexArray = @[@(startIndex - 10), @(startIndex), @(startIndex + 1),  @(startIndex + 11)].mutableCopy;
        self.maxSteps = 17;
        self.checkBottomArray = @[@1, @3];
        self.checkLeftArray = @[@0, @1, @3];
        self.checkRightArray = @[@0, @2, @3];
        self.currentSquareType = 0;
    }
}
@end
