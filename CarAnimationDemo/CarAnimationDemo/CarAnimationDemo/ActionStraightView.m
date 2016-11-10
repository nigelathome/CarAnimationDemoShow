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
    snap.damping = arc4random_uniform(5) / 10.0 + 0.5;
    
    // 添加仿真行为
    [self.animator addBehavior:snap];
}


@end
