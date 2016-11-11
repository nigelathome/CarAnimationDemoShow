//
//  ActionStraightView.m
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "ActionStraightView.h"

@interface ActionStraightView()

@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, strong) UIImageView *ballView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval timeOffset;
@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;

- (void)animate;
@end

@implementation ActionStraightView

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
        [self animate];
    }
    
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    // 移除之前的仿真行为
//    [self.animator removeAllBehaviors];
//    
//    CGPoint location = [touches.anyObject locationInView:self];
//    
//    // 添加行为
//    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.vehicle snapToPoint:location];
//    // 随机振幅
////    snap.damping = arc4random_uniform(5) / 10.0 + 0.5;
//    
//    // 添加仿真行为
//    [self.animator addBehavior:snap];
//    [self automaticBegan];
     [self animate];
}

float interpolate(float from, float to, float time)
{
    return (to - from) * time + from;
}

- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time
{
    if ([fromValue isKindOfClass:[NSValue class]]) {
        //get type
        const char *type = [(NSValue *)fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            CGPoint toValuePoint = [toValue CGPointValue];
            if (result.y >= 100) {
                return [NSValue valueWithCGPoint:result];
            }
            
        }
    }
    //provide safe default implementation
//    return (time < 0.5)? fromValue: toValue;
    return nil;
}

//- (void)automaticBegan
//{
//    // 移除之前的仿真行为
//    [self.animator removeAllBehaviors];
//    
////     CGFloat x = [self getRandomNumber:1 to:100];
//    //获取一个随机数范围在：[500,1000），包括500，不包括1000
////    CGFloat y = [self getRandomNumber:1 to:100];
//    CGFloat x = 100;
//    CGFloat y = 150;
//    CGPoint startLocation = CGPointMake(x, y);
//    
//    // 添加行为
//    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.vehicle snapToPoint:startLocation];
//    // 随机振幅
//    //    snap.damping = arc4random_uniform(5) / 10.0 + 0.5;
//    
//    // 添加仿真行为
//    [self.animator addBehavior:snap];
//}

////获取一个随机整数，范围在[from,to），包括from，不包括to
//-(int)getRandomNumber:(int)from to:(int)to
//{
//    return (int)(from + (arc4random() % (-from + to + 1)));
//}

- (void)animate
{
    //reset car to top of screen
//    self.vehicle.center = CGPointMake(150, 600);
    //configure the animation
    self.duration = 1.0;
    self.timeOffset = 0.0;
    self.fromValue = [NSValue valueWithCGPoint:CGPointMake(120, 700)];
    self.toValue = [NSValue valueWithCGPoint:CGPointMake(120, -100)];
    //stop the timer if it's already running
    [self.timer invalidate];
    //start the timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1/60.0
                                                  target:self
                                                selector:@selector(step:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)step:(NSTimer *)step
{
    //update time offset
//    self.timeOffset = MIN(self.timeOffset + 1/1000.0, self.duration);
    self.timeOffset = self.timeOffset + 1/1000.0;

    //get normalized time offset (in range 0 - 1)
    float time = self.timeOffset / self.duration;
    //apply easing
    time = bounceEaseOut(time);
    //interpolate position
    id position = [self interpolateFromValue:self.fromValue
                                     toValue:self.toValue
                                        time:time];
    //move ball view to new position
    self.vehicle.center = [position CGPointValue];
    //stop the timer if we've reached the end of the animation
    if (self.timeOffset >= self.duration) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

float bounceEaseOut(float t)
{
    if (t < 4/11.0) {
        return (121 * t * t)/16.0;
      
    } else if (t < 8/11.0) {
        return 0;
//        return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
    } else if (t < 9/10.0) {
//        return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
    }
//    return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
    return 0;
}

@end
