//
//  ContrastFilterView.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/11.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface ContrastFilterView : UIView

@property(nonatomic, strong) GPUImageContrastFilter *contrastFilter;
@property(nonatomic, strong) UIImage     *originalImage;    @property(nonatomic, strong) UIImageView *editImageView;

@end
