//
//  SelectPhotoViewCell.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/11.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "SelectPhotoViewCell.h"
#import "EditViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation SelectPhotoViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    [self.thumbnailImageView setImage:image];
}

- (UIImage *)editImage
{
    ALAssetRepresentation *rep = [self.asset defaultRepresentation];
    return [UIImage imageWithCGImage:[rep fullScreenImage]];
}

- (IBAction)selected:(id)sender
{
    UIImage *editImage = [self editImage];
    ViewControllerManager *manager = [self.selectPhotoVC manager];
    [manager popViewControllerAnimated:YES];
    NSArray *controllers = [manager viewControllers];
    EditViewController *editVC = (EditViewController *)controllers[1];
    editVC.editImage = editImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
