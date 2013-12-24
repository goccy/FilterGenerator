//
//  OverlayFilterViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/20.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "OverlayFilterViewController.h"
#import "SelectOverlayImageViewController.h"
#import "OverlayFilterViewCell.h"
#import "FilterView.h"

#define FILTER_IDENTIFIER @"OVERLAY"

@interface OverlayFilterViewController ()

@end

@implementation OverlayFilterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.selectedImages = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"OverlayFilterViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"binding_dark.png"]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.collectionView reloadData];
    if (![self.selectedImages count]) return;
    if (!self.editVC.originalImage) return;
    NSMutableArray *overlayImages = [NSMutableArray array];
    for (UIImage *image in self.selectedImages) {
        [overlayImages addObject:image];
    }
    [self.editVC.filterParameter setObject:overlayImages forKey:FILTER_IDENTIFIER];
    UIImage *filteredImage = [[FilterView alloc] makeFilteredImageByFilterParameter:self.editVC.filterParameter image:self.editVC.originalImage];
    [self.editVC.editImageView setImage:filteredImage];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.selectedImages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OverlayFilterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) cell = [[OverlayFilterViewCell alloc] init];
    UIImage *image  = self.selectedImages[indexPath.row];
    cell.thumbnailImageView.image = image;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)touchAddOverlayImageButton:(id)sender
{
    SelectOverlayImageViewController *overlayImageVC = [[SelectOverlayImageViewController alloc] initWithNibName:@"SelectOverlayImageViewController" bundle:nil];
    overlayImageVC.overlayFilterVC = self;
    ViewControllerManager *manager = [self manager];
    [manager pushViewController:overlayImageVC animated:YES];
}

@end
