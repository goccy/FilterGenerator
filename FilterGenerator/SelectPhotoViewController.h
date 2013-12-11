//
//  SelectPhotoViewController.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/11.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class ALAssetsLibrary;

@interface SelectPhotoViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) ALAssetsLibrary *library;
@property(nonatomic, strong) NSMutableArray *photos;
@property(nonatomic, strong) NSMutableArray *groups;

@end
