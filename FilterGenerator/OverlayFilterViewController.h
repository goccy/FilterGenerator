//
//  OverlayFilterViewController.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/20.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "EditViewController.h"

@interface OverlayFilterViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) IBOutlet UIButton *addOverlayImageButton;
@property(nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSMutableArray *selectedImages;
@property(nonatomic, strong) EditViewController *editVC;

@end
