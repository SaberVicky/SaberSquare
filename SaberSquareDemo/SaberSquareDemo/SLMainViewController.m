//
//  SLMainViewController.m
//  SaberSquareDemo
//
//  Created by songlong on 16/4/11.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLMainViewController.h"
#import "SLBaseSquare.h"
#import "SLSquareO.h"
#import "SLSquareT.h"
#import "SLSquareI.h"
#import "SLSquareL.h"
#import "SLSquareS.h"
#import "SLSquareZ.h"

#define kStartIndex 5
#define kBgWidth 200
#define kBgHeight 400
#define kColumns 10
#define kRows 20

@interface SLMainViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger timerCount;
@property (nonatomic, strong) SLBaseSquare *currentSquare;

@end

@implementation SLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupGameViewWithColumns:kColumns andRows:kRows andFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - kBgWidth / 2, [UIScreen mainScreen].bounds.size.height / 2 - kBgHeight / 2, kBgWidth, kBgHeight)];
    [self setupSwipe];
    [self setupLeftRightButton];
    [self randomSquare];
}



#pragma mark - Private Method
//创建背景网格图
- (void)setupGameViewWithColumns:(NSInteger)column andRows:(NSInteger)row andFrame:(CGRect)frame {
    
    UIView *bgView = [[UIView alloc] initWithFrame:frame];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    
    NSInteger count = column * row;
    for (int i = 0; i < count; i++) {
        CGFloat squareW = frame.size.width / column;
        CGFloat squareH = frame.size.height / row;
        CGFloat squareX = i % column * squareW;
        CGFloat squareY = i / column * squareH;
        UIView *squareView = [[UIView alloc] initWithFrame:CGRectMake(squareX, squareY, squareW, squareH)];
        squareView.hidden = YES;
        squareView.tag = i + 1;
        squareView.backgroundColor = [UIColor redColor];
        [bgView addSubview:squareView];
    }
}

//获得一个随机方块
- (void)randomSquare {
    
    int randomNumber = arc4random() % 6;
    SLBaseSquare *square = [[SLBaseSquare alloc] init];
    
    square = [[SLSquareO alloc] initWithStartIndex:kStartIndex];
    
    switch (randomNumber) {
        case 0:
            square = [[SLSquareO alloc] initWithStartIndex:kStartIndex];
            break;
            
        case 1:
            square = [[SLSquareT alloc] initWithStartIndex:kStartIndex];
            break;
            
        case 2:
            square = [[SLSquareI alloc] initWithStartIndex:kStartIndex];
            break;
            
        case 3:
            square = [[SLSquareL alloc] initWithStartIndex:kStartIndex];
            break;
            
        case 4:
            square = [[SLSquareS alloc] initWithStartIndex:kStartIndex];
            break;
            
        case 5:
            square = [[SLSquareZ alloc] initWithStartIndex:kStartIndex];
            break;
            
        default:
            break;
    }
    
    self.currentSquare = square;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(squareMove) userInfo:nil repeats:YES];
    [self.timer fire];
    _timerCount = 0;
}

//每次的移动
- (void)squareMove {
    
    if (_timerCount == self.currentSquare.maxSteps) {
        [self checkClearSquare];
        [self.timer invalidate];
        [self randomSquare];
    } else if ([self checkStop]) {
        [self checkClearSquare];
        [self.timer invalidate];
        [self randomSquare];
    }
    
    
    for (int i = 0; i < _currentSquare.indexArray.count; i++) {
        UIView *square = [self.view viewWithTag:[_currentSquare.indexArray[i] intValue]];
        _currentSquare.indexArray[i] = @([_currentSquare.indexArray[i] intValue] + 10);
        square.hidden = YES;
    }
    
    for (int i = 0; i < _currentSquare.indexArray.count; i++) {
        UIView *square = [self.view viewWithTag:[_currentSquare.indexArray[i] intValue]];
        square.hidden = NO;
    }
    
    _timerCount++;
}

//检测底部是否碰到其它方块
- (BOOL)checkStop {
    
    for (int i = 0; i < _currentSquare.checkBottomArray.count; i++) {
        UIView *checkView = [self.view viewWithTag:[_currentSquare.indexArray[[_currentSquare.checkBottomArray[i] intValue]] intValue] + 10];
        if (!checkView.hidden) {
            return YES;
        }
    }
    
    return NO;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
//    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
//    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
//
//
//    CGFloat left = 500;
//    CGFloat top = 500;
//    CGFloat bottom = 0;
//    CGFloat right = 0;
//
//    for (int i = 0; i < _currentIndexArray.count; i++) {
//        UIView *squareView = [self.view viewWithTag:[_currentIndexArray[i] intValue]];
//        if (CGRectGetMinX(squareView.frame) < left) {
//            left = CGRectGetMinX(squareView.frame);
//        }
//
//        if (CGRectGetMinY(squareView.frame) < top) {
//            top = CGRectGetMinY(squareView.frame);
//        }
//
//        if (CGRectGetMaxX(squareView.frame) > right) {
//            right = CGRectGetMaxX(squareView.frame);
//        }
//
//        if (CGRectGetMaxY(squareView.frame) > bottom) {
//            bottom = CGRectGetMaxY(squareView.frame);
//        }
//    }
//
//    left = left + [UIScreen mainScreen].bounds.size.width / 2 - kBgWidth / 2;
//    right = right + [UIScreen mainScreen].bounds.size.width / 2 - kBgWidth / 2;
//    top = top + [UIScreen mainScreen].bounds.size.height / 2 - kBgHeight / 2;
//    bottom = bottom + [UIScreen mainScreen].bounds.size.height / 2 - kBgHeight / 2;
//
////    //变形
////    if (point.y < top) {
////        [self changeSquare];
////    }
////
////    //下降
////    if (point.y > bottom) {
////        [self moveDown];
////    }
//
//    //左移
//    if (point.x < left) {
//        [self moveLeft];
//    }
//
//    //右移
//    if (point.x > right) {
//        [self moveRight];
//    }
//}

- (void)setupLeftRightButton {
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 + kBgHeight / 2, [UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2 - kBgHeight / 2)];
    [leftButton addTarget:self action:@selector(moveLeft) forControlEvents:UIControlEventTouchUpInside];
    //    leftButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2 + kBgHeight / 2, [UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2 - kBgHeight / 2)];
    [rightButton addTarget:self action:@selector(moveRight) forControlEvents:UIControlEventTouchUpInside];
    //    rightButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:rightButton];
}

- (void)setupSwipe {
    UISwipeGestureRecognizer *swip;
    swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(changeSquare)];
    swip.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swip];
    
    swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(moveDown)];
    swip.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swip];
}

- (void)moveLeft {
    NSLog(@"左");
    
    for (int i = 0; i < _currentSquare.checkLeftArray.count; i++) {
        UIView *checkView = [self.view viewWithTag:[_currentSquare.indexArray[[_currentSquare.checkLeftArray[i] intValue]] intValue] - 1];
        if (!checkView.hidden) {
            return;
        }
    }
    
    for (int i = 0; i < _currentSquare.indexArray.count; i++) {
        UIView *square = [self.view viewWithTag:[_currentSquare.indexArray[i] intValue]];
        _currentSquare.indexArray[i] = @([_currentSquare.indexArray[i] intValue] - 1);
        square.hidden = YES;
    }
    
    for (int i = 0; i < _currentSquare.indexArray.count; i++) {
        UIView *square = [self.view viewWithTag:[_currentSquare.indexArray[i] intValue]];
        square.hidden = NO;
    }
}

- (void)moveRight {
    NSLog(@"右");
    
    for (int i = 0; i < _currentSquare.checkRightArray.count; i++) {
        UIView *checkView = [self.view viewWithTag:[_currentSquare.indexArray[[_currentSquare.checkRightArray[i] intValue]] intValue] + 1];
        if (!checkView.hidden) {
            return;
        }
    }
    
    for (int i = 0; i < _currentSquare.indexArray.count; i++) {
        UIView *square = [self.view viewWithTag:[_currentSquare.indexArray[i] intValue]];
        _currentSquare.indexArray[i] = @([_currentSquare.indexArray[i] intValue] + 1);
        square.hidden = YES;
    }
    
    for (int i = 0; i < _currentSquare.indexArray.count; i++) {
        UIView *square = [self.view viewWithTag:[_currentSquare.indexArray[i] intValue]];
        square.hidden = NO;
    }
}

- (void)moveDown {
    NSLog(@"下");
    
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(squareMove) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)changeSquare {
    NSLog(@"上");
    for (int i = 0; i < self.currentSquare.indexArray.count; i++) {
        UIView *squareView = [self.view viewWithTag:[self.currentSquare.indexArray[i] intValue]];
        squareView.hidden = YES;
    }
    [self.currentSquare randomSquare];
    for (int i = 0; i < self.currentSquare.indexArray.count; i++) {
        UIView *squareView = [self.view viewWithTag:[self.currentSquare.indexArray[i] intValue]];
        squareView.hidden = NO;
    }
}

//检测是否达到消除条件
- (void)checkClearSquare {
    for (int i = 0; i < kRows; i++) {
        
        BOOL clear = YES;
        
        for (int j = 0; j < kColumns; j++) {
            UIView *square = [self.view viewWithTag:i * kColumns + j + 1];
            if (square.hidden) {
                clear = NO;
                break;
            }
        }
        
        if (clear) {
            for (int j = 0; j < kColumns; j++) {
                UIView *square = [self.view viewWithTag:i * kColumns + j + 1];
                square.hidden = YES;
            }
            
            [self moveDownAfterClearWithRow:i];
            
        }
    }
}

//消除后其他行下降
- (void)moveDownAfterClearWithRow:(int)row {
    for (int k = row - 1; k >= 0; k --) {
        for (int j = 0; j < kColumns; j++) {
            UIView *square = [self.view viewWithTag:k * kColumns + j + 1];
            if (!square.hidden) {
                UIView *square = [self.view viewWithTag:(k + 1) * kColumns + j + 1];
                square.hidden = NO;
            }
        }
        
        for (int j = 0; j < kColumns; j++) {
            UIView *square = [self.view viewWithTag:k * kColumns + j + 1];
            square.hidden = YES;
        }
    }
}

@end
