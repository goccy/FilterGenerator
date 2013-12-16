//
//  EditViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "EditViewController.h"
#import "FilterView.h"

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.filterParameter = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.editImageView.contentMode = UIViewContentModeScaleAspectFit;
    if (self.editImage) self.editImageView.image = self.editImage;
    if (self.filterView) {
        [self.view addSubview: self.filterView];
    }
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

- (IBAction)touchSaveButton:(id)sender
{
    SaveViewController *saveVC = [[SaveViewController alloc] initWithNibName:@"SaveViewController" bundle:nil];
    saveVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:saveVC animated:YES];
}

@end
