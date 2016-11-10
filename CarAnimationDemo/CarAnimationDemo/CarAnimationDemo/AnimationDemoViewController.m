//
//  AnimationDemoViewController.m
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "AnimationDemoViewController.h"
#import "DemoView.h"
#import "ActionStraightView.h"
#import "ActionTurningAroundView.h"
#import "ActionMovingContinuingView.h"

@interface AnimationDemoViewController ()

//@property (assign, nonatomic) ActionItemType type;

@end

@implementation AnimationDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DemoView *demoView = nil;
    
    switch (self.type) {
        case ActionStraight: // 直行
            demoView = [[ActionStraightView alloc] initWithFrame:self.view.bounds];
            break;
            
        case ActionTurningAround: // 掉头
            demoView = [[ActionTurningAroundView alloc] initWithFrame:self.view.bounds];
            break;
            
        case ActionMovingContinuing: // 连续行驶
            demoView = [[ActionMovingContinuingView alloc] initWithFrame:self.view.bounds];
            break;
            
        default:
            break;
    }
    
    [self.view addSubview:demoView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
