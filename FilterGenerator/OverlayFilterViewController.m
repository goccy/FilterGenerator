//
//  OverlayFilterViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/20.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "OverlayFilterViewController.h"
#import "SelectOverlayImageViewController.h"

@interface OverlayFilterViewController ()

@end

@implementation OverlayFilterViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)touchAddOverlayImageButton:(id)sender
{
    SelectOverlayImageViewController *overlayImageVC = [[SelectOverlayImageViewController alloc] initWithNibName:@"SelectOverlayImageViewController" bundle:nil];
    ViewControllerManager *manager = [self manager];
    [manager pushViewController:overlayImageVC animated:YES];
}

@end
