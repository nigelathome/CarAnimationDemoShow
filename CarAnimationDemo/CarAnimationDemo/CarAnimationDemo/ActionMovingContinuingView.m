//
//  ActionMovingContinuing.m
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "ActionMovingContinuingView.h"

@interface ActionMovingContinuingView ()
{
    CGPoint beginPoint;  // 记录拖动起始点
    CGPoint endPoint;  //   记录拖动起终点
    CGPoint movePoint;  // 记录移动过程中的点
}
@property (assign, nonatomic) UIPushBehavior *push;   // 记录仿真行为
@property (assign, nonatomic) UIImageView    *finger; // 记录点按手指印
    

@end

@implementation ActionMovingContinuingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1. 添加手势识别
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        
        [self addGestureRecognizer:pan];
        
        // 2. 添加仿真行为
        self.push = [[UIPushBehavior alloc] initWithItems:@[self.vehicle] mode:UIPushBehaviorModeInstantaneous];
        
        [self.animator addBehavior:self.push];
        
        // 3. 添加碰撞检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.vehicle]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        [self.animator addBehavior:collision];
        
        // 4. 添加模拟点按手指
        self.finger = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        self.finger.hidden = YES;
        
        [self addSubview:self.finger];
        
        _finger.tintColor = [UIColor blueColor]; // 设置为蓝色
        _finger.image = [_finger.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_finger setNeedsDisplay];
    }
    return self;
}

#pragma mark 滑动手势
- (void)pan:(UIPanGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:self];
    
    if (UIGestureRecognizerStateBegan == gesture.state) {
        
        // 获取起始点
        self->beginPoint = location;
        
        // 显示点按手指
        self.finger.hidden = NO;
        self.finger.center = self->beginPoint;
        
    }else if (UIGestureRecognizerStateChanged == gesture.state){
        
        // 渲染拉伸路线
        self->movePoint = location;
        
        [self setNeedsDisplay];
        
    }else if (UIGestureRecognizerStateEnded == gesture.state){
        
        // 如果起始点在box内，执行仿真动画
        if (CGRectContainsPoint(self.vehicle.frame, self->beginPoint)){
            
            // 设置推动仿真的属性
            self->endPoint = location;
            
            CGPoint offset = CGPointMake(self->beginPoint.x - self->endPoint.x, self->beginPoint.y - self->endPoint.y);
            
            self.push.active = YES;
            self.push.angle = atan2f(offset.y, offset.x); // 角度
            self.push.magnitude = sqrtf(offset.x * offset.x + offset.y * offset.y) / 50; // 推动力量
            
        }
        
        // 隐藏点按手指
        _finger.hidden = YES;
        
        // 清楚拉伸线
        [self clearLine];
    }
}

#pragma mark 清除拉伸线
- (void)clearLine
{
    self->beginPoint = CGPointZero;
    self->movePoint = CGPointZero;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // 绘制拉伸线路
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, self->beginPoint.x, self->beginPoint.y);
    CGContextAddLineToPoint(context, self->movePoint.x, self->movePoint.y);
    
    CGContextSetLineWidth(context, 5.0f);
    CGFloat length[] = {15.0, 5.0};
    CGContextSetLineDash(context, 0.0, length, 2);
    [[UIColor blackColor] setStroke];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
