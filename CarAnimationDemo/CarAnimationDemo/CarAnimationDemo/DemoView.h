//
//  DemoView.h
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 
 * base class used for defining import variable n method
 */
@interface DemoView : UIView

@property (weak, nonatomic) UIImageView *vehicle; //reference a car in view
@property (strong, nonatomic) UIDynamicAnimator *animator;

@end
