//
//  BrightnessFilterView.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/16.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "BrightnessFilterView.h"
#import "SliderView.h"
#define FILTER_IDENTIFIER @"BRIGHTNESS"

@implementation BrightnessFilterView

- (id)initWithEditViewController:(EditViewController *)editVC
{
    CGRect frame = editVC.editView.frame;
    self = [super initWithEditViewController:editVC];
    if (self) {
        SliderView *slider = [[SliderView alloc] initWithFrame:frame];
        slider.minimumValue = 0.0f;
        slider.maximumValue = 0.5f;
        NSNumber *brightness = editVC.filterParameter[FILTER_IDENTIFIER];
        if (brightness) slider.value = [brightness floatValue];
        [slider addTarget:self action:@selector(changedContrast:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider];
    }
    return self;
}

- (void)changedContrast:(UISlider *)slider
{
    float brightness = slider.value;
    [self.editVC.filterParameter setObject:@(brightness) forKey:FILTER_IDENTIFIER];
    UIImage *filteredImage = [self makeFilteredImageByFilterParameter:self.editVC.filterParameter image:self.originalImage];
    [self.editImageView setImage:filteredImage];
}

@end
