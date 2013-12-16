//
//  FilterSelectViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/10.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "FilterSelectViewController.h"

@interface FilterSelectViewController ()

@end

@implementation FilterSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    cell.text = [NSString stringWithCString:filterDeclare[indexPath.row].name encoding:NSUTF8StringEncoding];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    if (!filterDeclare[index].isImplemented) return;
    ViewControllerManager *manager = [self manager];
    [manager popViewControllerAnimated:YES];
    NSArray *controllers = [manager viewControllers];
    EditViewController *editVC  = (EditViewController *)controllers[1];
    FilterViewGetter viewGetter = (FilterViewGetter)filterDeclare[index].filterView;
    UIView *previousFilterView = editVC.filterView;
    editVC.filterView = viewGetter(editVC);
    for (UIView *view in [editVC.view subviews]) {
        if (view == previousFilterView) [view removeFromSuperview];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return GPUIMAGE_END_FILTER - 1;
}

@end
