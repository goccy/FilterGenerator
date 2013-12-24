//
//  SelectOverlayImageCell.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/20.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

@class ALAsset;
#import "SelectOverlayImageViewController.h"
#import "SelectOverlayImageCell.h"
#import "EditViewController.h"
#import "OverlayFilterViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation SelectOverlayImageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIImage *)image
{
    ALAssetRepresentation *rep = [self.asset defaultRepresentation];
    return [UIImage imageWithCGImage:[rep fullScreenImage]];
}

- (IBAction)selected:(id)sender
{
    ViewControllerManager *manager = [self.overlayImageVC manager];
    NSArray *controllers = [manager viewControllers];
    SelectOverlayImageViewController *selectOverlayImageVC = controllers[2];
    UIImage *selectedImage  = [self image];
    [selectOverlayImageVC.overlayFilterVC.selectedImages addObject:selectedImage];
    [manager popViewControllerAnimated:YES];
}

@end
