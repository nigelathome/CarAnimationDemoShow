//
//  ActionStraightView.m
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "ActionStraightView.h"

@implementation ActionStraightView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 移除之前的仿真行为
    [self.animator removeAllBehaviors];
    
    CGPoint location = [touches.anyObject locationInView:self];
    
    // 添加行为
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.vehicle snapToPoint:location];
    // 随机振幅
//    snap.damping = arc4random_uniform(5) / 10.0 + 0.5;
    
    // 添加仿真行为
    [self.animator addBehavior:snap];
//    [self automaticBegan];
}

- (void)automaticBegan
{
    // 移除之前的仿真行为
    [self.animator removeAllBehaviors];
    
//     CGFloat x = [self getRandomNumber:1 to:100];
    //获取一个随机数范围在：[500,1000），包括500，不包括1000
//    CGFloat y = [self getRandomNumber:1 to:100];
    CGFloat x = 100;
    CGFloat y = 150;
    CGPoint startLocation = CGPointMake(x, y);
    
    // 添加行为
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.vehicle snapToPoint:startLocation];
    // 随机振幅
    //    snap.damping = arc4random_uniform(5) / 10.0 + 0.5;
    
    // 添加仿真行为
    [self.animator addBehavior:snap];
}


//获取一个随机整数，范围在[from,to），包括from，不包括to
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (-from + to + 1)));
}


@end
