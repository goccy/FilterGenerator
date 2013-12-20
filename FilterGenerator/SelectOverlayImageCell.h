//
//  SelectOverlayImageCell.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/20.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectPhotoViewCell.h"

@interface SelectOverlayImageCell : SelectPhotoViewCell

@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, strong) SelectOverlayImageViewController *overlayImageVC;

@end
