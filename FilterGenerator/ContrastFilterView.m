//
//  ContrastFilterView.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/11.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "ContrastFilterView.h"

@implementation ContrastFilterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float frameWidth   = frame.size.width;
        float frameHeight  = frame.size.height;
        float sliderWidth  = frameWidth - 10;
        float sliderHeight = 30;
        float sliderX = (frameWidth - sliderWidth) / 2;
        float sliderY = (frameHeight - sliderHeight) / 2;
        CGRect sliderRect = CGRectMake(sliderX, sliderY, sliderWidth, sliderHeight);
        UISlider *slider = [[UISlider alloc] initWithFrame:sliderRect];
        [self addSubview:slider];
    }
    return self;
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
