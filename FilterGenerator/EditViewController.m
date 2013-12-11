//
//  EditViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "EditViewController.h"
#import "ContrastFilterView.h"

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
    //[self.view addSubview:[[ContrastFilterView alloc] initWithFrame:self.view.frame]];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.editImage) [self.editImageView setImage:self.editImage];
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
    SelectPhotoViewController *photoVC = [[SelectPhotoViewController alloc] initWithNibName:@"SelectPhotoViewController" bundle:nil];
    ViewControllerManager *manager = [self manager];
    [manager pushViewController:photoVC animated:YES];
}

@end
