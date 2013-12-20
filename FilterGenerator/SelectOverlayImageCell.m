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
    [manager popViewControllerAnimated:YES];
    NSArray *controllers = [manager viewControllers];
    //OverlayFilterViewControllerのcollectionViewに[self image]の結果をsetする
    //OverlayBlendFilterを使ってEditImageViewの画像をフィルタリングする
//    EditViewController *editVC = (EditViewController *)controllers[1];
//    editVC.editImage = editImage;
//    editVC.originalImage = editImage;
}

@end
