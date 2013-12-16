//
//  FilterView.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/16.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"

@interface FilterView : UIView

@property(nonatomic, strong) UIImage *originalImage;
@property(nonatomic, strong) UIImageView *editImageView;
@property(nonatomic, strong) EditViewController *editVC;

- (UIView *)initWithEditViewController:(EditViewController *)editVC;
- (UIImage *)makeFilteredImageByFilterParameter:(NSMutableDictionary *)filterParameter image:(UIImage *)image;

@end
