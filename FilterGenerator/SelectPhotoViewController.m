//
//  SelectPhotoViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/11.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "SelectPhotoViewController.h"
#import "SelectPhotoViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation SelectPhotoViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.photos = [NSMutableArray array];
        self.groups = [NSMutableArray array];
        __weak SelectPhotoViewController *weakSelf = self;
        self.library = [[ALAssetsLibrary alloc] init];
        //NSUInteger groupTypes = ALAssetsGroupAlbum | ALAssetsGroupEvent | ALAssetsGroupFaces;
        ALAssetsLibraryGroupsEnumerationResultsBlock groupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
            if (!group) return;
            ALAssetsFilter *groupFilter = [ALAssetsFilter allPhotos];
            [group setAssetsFilter: groupFilter];
            [group enumerateAssetsUsingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop) {
                if (!asset) return;
                UIImage *thumbnailImage = [UIImage imageWithCGImage: [asset thumbnail]];
                NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                           asset, @"asset", thumbnailImage, @"thumbnail", nil];
                [weakSelf.photos addObject:dictionary];
            }];
        };
        [self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:groupBlock failureBlock:^(NSError *error){
            NSLog(@"[ERROR]: %@", error);
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SelectPhotoViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SelectPhotoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) cell = [[SelectPhotoViewCell alloc] init];
    NSDictionary *dictionary = self.photos[indexPath.row];
    ALAsset *asset = [dictionary objectForKey:@"asset"];
    UIImage *thumbnail = [dictionary objectForKey:@"thumbnail"];
    cell.selectPhotoVC = self;
    [cell setAsset:asset];
    [cell setImage:thumbnail];
    return cell;
}

@end
