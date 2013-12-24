//
//  FilterView.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/16.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "FilterView.h"
#import "GPUImage.h"
#import "FilterTypeDelclare.h"

@implementation FilterView

- (id)initWithEditViewController:(EditViewController *)editVC
{
    CGRect frame = editVC.editView.frame;
    self = [super initWithFrame:frame];
    if (self) {
        self.editVC = editVC;
        self.editImageView = editVC.editImageView;
        UIImage *image = editVC.originalImage;
        UIImage *filteredImage = [self makeFilteredImageByFilterParameter:editVC.filterParameter image:image];
        self.originalImage = image;
        editVC.editImage   = filteredImage;
    }
    return self;
}

- (UIImage *)makeFilteredImageByFilterParameter:(NSMutableDictionary *)filterParameter image:(UIImage *)image
{
    GPUImagePicture *picture   = [[GPUImagePicture alloc] initWithImage:image smoothlyScaleOutput:YES];
    GPUImageFilterGroup *group = [[GPUImageFilterGroup alloc] init];
    GPUImageFilter *beforeFilter = NULL;
    GPUImageFilter *firstFilter  = NULL;
    GPUImageFilter *lastFilter   = NULL;
    if ([filterParameter objectForKey:@"OVERLAY"]) {
        image = [self makeOverlayFilterByFilterParameter:filterParameter image:image];
        [filterParameter removeObjectForKey:@"OVERLAY"];
    }
    if (![filterParameter count]) return image;
    for (NSString *filterName in [filterParameter allKeys]) {
        FilterMethod filterMethod = getFilterMethod([filterName UTF8String]);
        GPUImageFilter *filter = filterMethod([filterParameter objectForKey:filterName]);
        [group addFilter:filter];
        if (beforeFilter) {
            [beforeFilter addTarget: filter];
        } else {
            firstFilter = filter;
        }
        beforeFilter = filter;
        lastFilter   = filter;
    }
    
    [group setInitialFilters:[NSArray arrayWithObject: firstFilter]];
    [group setTerminalFilter:lastFilter];
    
    [picture addTarget:firstFilter];
    [picture processImage];
    [group prepareForImageCapture];
    UIImage *ret = [group imageFromCurrentlyProcessedOutput];
    return ret;
}

- (UIImage *)makeOverlayFilterByFilterParameter:(NSMutableDictionary *)filterParameters image:(UIImage *)image
{
    NSMutableArray *images = [filterParameters objectForKey:@"OVERLAY"];
    UIImage *ret = image;
    for (UIImage *overlayImage in images) {
        GPUImageOverlayBlendFilter *overlayFilter = [[GPUImageOverlayBlendFilter alloc] init];
        GPUImagePicture *src = [[GPUImagePicture alloc] initWithImage:ret];
        GPUImagePicture *dst = [[GPUImagePicture alloc] initWithImage:overlayImage];
        [src addTarget:overlayFilter];
        [dst addTarget:overlayFilter];
        [src processImage];
        [dst processImage];
        ret = [overlayFilter imageFromCurrentlyProcessedOutput];
    }
    return ret;
}

@end
