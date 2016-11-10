//
//  DemoView.m
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "DemoView.h"

@interface DemoView()
@property (weak, nonatomic) UIImageView *vehicle; //reference a car in view
@property (strong, nonatomic) UIDynamicAnimator *animator;
@end

@implementation DemoView

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
        // 1.set background
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        
        // 2.set car
        UIImageView *vehicle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Vehicle"]];
        vehicle.center = self.center;
        self.vehicle = vehicle;
        [self addSubview:vehicle];
        
        // 3.set animator
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    }
    
    return self;
}

@end
