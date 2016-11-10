//
//  AnimationDemoViewController.h
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ActionItemType) {
    ActionStraight, //默认从0开始
    ActionTurningAround,
    ActionMovingContinuing,
};

@interface AnimationDemoViewController : UIViewController

@end
