//
//  SLSquareO.m
//  SaberSquareDemo
//
//  Created by songlong on 16/4/11.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLSquareO.h"

@implementation SLSquareO
- (instancetype)initWithStartIndex:(NSInteger)startIndex {
    if (self = [super initWithStartIndex:startIndex]) {
        self.indexArray = @[@(startIndex), @(startIndex + 1), @(startIndex + 10),  @(startIndex + 11)].mutableCopy;
        self.maxSteps = 18;
        self.checkBottomArray = @[@2, @3];
        self.checkLeftArray = @[@0, @2];
        self.checkRightArray = @[@1, @3];
    }
    return self;
}

- (void)randomSquare {
    
}
@end
