//
//  BrightnessFilterView.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/16.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "BrightnessFilterView.h"
#define SLIDER_HEIGHT 30
#define FILTER_IDENTIFIER @"BRIGHTNESS"

@implementation BrightnessFilterView

- (id)initWithEditViewController:(EditViewController *)editVC
{
    CGRect frame = editVC.editView.frame;
    self = [super initWithEditViewController:editVC];
    if (self) {
        float frameWidth   = frame.size.width;
        float frameHeight  = frame.size.height;
        float sliderWidth  = frameWidth - 10;
        float sliderHeight = SLIDER_HEIGHT;
        float sliderX = (frameWidth - sliderWidth) / 2;
        float sliderY = (frameHeight - sliderHeight) / 2;
        CGRect sliderRect = CGRectMake(sliderX, sliderY, sliderWidth, sliderHeight);
        UISlider *slider = [[UISlider alloc] initWithFrame:sliderRect];
        slider.minimumValue = 0.0f;
        slider.maximumValue = 1.0f;
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
