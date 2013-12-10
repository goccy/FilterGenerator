//
//  EditViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "EditViewController.h"

@implementation EditViewController

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

- (IBAction)touchFilterSelectButton:(id)sender
{
    FilterSelectViewController *selectVC = [[FilterSelectViewController alloc] initWithNibName:@"FilterSelectViewController" bundle:nil];
    ViewControllerManager *manager = [self manager];
    [manager pushViewController:selectVC animated:YES];
}

- (IBAction)touchImageSelectButton:(id)sender
{
}
@end
