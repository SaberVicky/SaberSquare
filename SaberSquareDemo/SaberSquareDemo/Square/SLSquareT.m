//
//  SLSquareT.m
//  SaberSquareDemo
//
//  Created by songlong on 16/4/11.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLSquareT.h"

@implementation SLSquareT
- (instancetype)initWithStartIndex:(NSInteger)startIndex {
    if (self = [super initWithStartIndex:startIndex]) {
        self.indexArray = @[@(startIndex), @(startIndex + 1), @(startIndex + 2),  @(startIndex + 11)].mutableCopy;
        self.maxSteps = 18;
        self.checkBottomArray = @[@0, @2, @3];
        self.checkLeftArray = @[@0, @3];
        self.checkRightArray = @[@2, @3];
    }
    return self;
}

- (void)randomSquare {
    NSInteger startIndex = [self.indexArray[0] integerValue];
    if (self.currentSquareType == 0) {
        self.indexArray = @[@(startIndex), @(startIndex + 10), @(startIndex + 20),  @(startIndex + 11)].mutableCopy;
        self.maxSteps = 17;
        self.checkBottomArray = @[@2, @3];
        self.checkLeftArray = @[@0, @1, @2];
        self.checkRightArray = @[@0, @2, @3];
        self.currentSquareType = 1;
    } else if (self.currentSquareType == 1) {
        self.indexArray = @[@(startIndex + 1), @(startIndex + 10), @(startIndex + 11),  @(startIndex + 12)].mutableCopy;
        self.maxSteps = 18;
        self.checkBottomArray = @[@1, @2, @3];
        self.checkLeftArray = @[@0, @1];
        self.checkRightArray = @[@0, @3];
        self.currentSquareType = 2;
    } else if (self.currentSquareType == 2) {
        self.indexArray = @[@(startIndex), @(startIndex + 10), @(startIndex + 20),  @(startIndex + 9)].mutableCopy;
        self.maxSteps = 17;
        self.checkBottomArray = @[@2, @3];
        self.checkLeftArray = @[@0, @2, @3];
        self.checkRightArray = @[@0, @1, @2];
        self.currentSquareType = 3;
    } else {
        self.indexArray = @[@(startIndex - 1), @(startIndex), @(startIndex + 1),  @(startIndex + 10)].mutableCopy;
        self.maxSteps = 18;
        self.checkBottomArray = @[@0, @2, @3];
        self.checkLeftArray = @[@0, @3];
        self.checkRightArray = @[@2, @3];
        self.currentSquareType = 0;
    }
}
@end
