//
//  ContrastFilterView.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/11.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "ContrastFilterView.h"

#define SLIDER_HEIGHT 30
#define FILTER_IDENTIFIER @"CONTRAST"

@implementation ContrastFilterView

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
        slider.maximumValue = 10.0f;
        NSNumber *contrast = editVC.filterParameter[FILTER_IDENTIFIER];
        if (contrast) slider.value = [contrast floatValue];
        [slider addTarget:self action:@selector(changedContrast:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider];
    }
    return self;
}

- (void)changedContrast:(UISlider *)slider
{
    float contrast = slider.value;
    [self.editVC.filterParameter setObject:@(contrast) forKey:FILTER_IDENTIFIER];
    UIImage *filteredImage = [self makeFilteredImageByFilterParameter:self.editVC.filterParameter image:self.originalImage];
    [self.editImageView setImage:filteredImage];
}

@end
