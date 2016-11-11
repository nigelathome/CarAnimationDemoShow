//
//  ViewController.m
//  CarAnimationDemo
//
//  Created by Nigel Lee on 10/11/2016.
//  Copyright © 2016 Apress. All rights reserved.
//

#import "ViewController.h"
#import "AnimationDemoViewController.h"

@interface ViewController ()

@property (copy, nonatomic) NSArray *items;  //测试项

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.items = @[@"直行", @"掉头", @"连续行驶"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView data source method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SimpleTableIdentifier];
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,320,15)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"车辆动画测试";
        return label.text;
    } else {
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,500)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"车辆动画测试";
        return label;
    } else {
        return nil;
    }

}

#pragma mark - tableView delegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationDemoViewController *animationDemoVC = [[AnimationDemoViewController alloc]init];
    animationDemoVC.title = self.items[indexPath.row];
    animationDemoVC.type = indexPath.row;
    
    [self.navigationController pushViewController:animationDemoVC animated:YES];
}



@end
