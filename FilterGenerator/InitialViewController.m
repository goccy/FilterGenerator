//
//  InitialViewContollerViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "InitialViewController.h"

@implementation InitialViewController

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

- (IBAction)touchDownButton:(id)sender
{
    NSLog(@"touch Down Button!!");
    EditViewController *editVC = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    ViewControllerManager *manager = [self manager];
    [manager pushViewController:editVC animated:YES];
}

@end
