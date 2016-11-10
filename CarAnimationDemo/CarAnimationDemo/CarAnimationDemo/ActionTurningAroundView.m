//
//  ActionTurningAround.m
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "ActionTurningAroundView.h"

@interface ActionTurningAroundView()

@property (assign, nonatomic) UIImageView *imageView;

@end

@implementation ActionTurningAroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1. 添加拖动手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        
        [self addGestureRecognizer:pan];
        
        // 2. 添加附着行为
        UIOffset offset = UIOffsetMake(-25, -25);
        self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.vehicle offsetFromCenter:offset attachedToAnchor:CGPointMake(self.vehicle.center.x, self.vehicle.center.y - 100)];
        
        [self.animator addBehavior:self.attachment];
        
        // 3. 添加车内部锚点图像
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        imageView.center = CGPointMake(self.vehicle.bounds.size.width / 2 + offset.horizontal, self.vehicle.bounds.size.height / 2 + offset.vertical);
        
        [self.vehicle addSubview:imageView];
        self.imageView = imageView;
    }
    
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    if (UIGestureRecognizerStateChanged == gesture.state) {
        self.attachment.anchorPoint = [gesture locationInView:self];
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGPoint p = [self convertPoint:self.imageView.center fromView:self.vehicle];
//    CGContextMoveToPoint(context, p.x, p.y);
//    CGContextAddLineToPoint(context, _attachment.anchorPoint.x, _attachment.anchorPoint.y);
//    
//    CGContextSetLineWidth(context, 5.0f);
//    CGFloat length[] = {5.0, 5.0};
//    CGContextSetLineDash(context, 0.0, length, 2);
//    [[UIColor blackColor] set];
//    
//    CGContextDrawPath(context, kCGPathStroke);
}
@end
