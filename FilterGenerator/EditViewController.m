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
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"binding_dark.png"]];
        self.editImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"debut_light.png"]];
        self.editImageView.layer.cornerRadius = 5;
        self.editImageView.clipsToBounds = true;
        self.title = @"Edit Filter";
        UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone
                                                                     target:self
                                                                     action:@selector(touchSaveButton:)];
        self.navigationItem.rightBarButtonItem = rightItem;
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
    if (self.editImage) {
        for (UIView *view in [self.view subviews]) {
            if (view == self.setImageButton) [view removeFromSuperview];
        }
        self.editImageView.image = self.editImage;
    }
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
    [self presentViewController:saveVC animated:YES completion: ^{}];
}

@end
