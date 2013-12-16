//
//  SliderView.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/16.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "SliderView.h"
#define SLIDER_HEIGHT 30

@implementation SliderView

- (id)initWithFrame:(CGRect)frame
{
    float frameWidth   = frame.size.width;
    float frameHeight  = frame.size.height;
    float sliderWidth  = frameWidth - 10;
    float sliderHeight = SLIDER_HEIGHT;
    float sliderX = (frameWidth - sliderWidth) / 2;
    float sliderY = (frameHeight - sliderHeight) / 2;
    CGRect sliderRect = CGRectMake(sliderX, sliderY, sliderWidth, sliderHeight);
    return [super initWithFrame:sliderRect];
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
