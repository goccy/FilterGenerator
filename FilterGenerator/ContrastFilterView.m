//
//  ContrastFilterView.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/11.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "ContrastFilterView.h"

#define SLIDER_HEIGHT 30

@implementation ContrastFilterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
        [slider addTarget:self action:@selector(changedContrast:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider];
        self.contrastFilter = [[GPUImageContrastFilter alloc] init];
    }
    return self;
}

- (void)changedContrast:(UISlider *)slider
{
    float contrast = slider.value;

    GPUImageContrastFilter *contrastFilter = self.contrastFilter;
    [contrastFilter setContrast:contrast];
    UIImage *editImage = self.originalImage;
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:editImage smoothlyScaleOutput:NO];
    [imagePicture addTarget:contrastFilter];
    [imagePicture processImage];
    UIImage *filteredImage = [contrastFilter imageFromCurrentlyProcessedOutput];
    [self.editImageView setImage:filteredImage];
}

@end
