//
//  SelectOverlayImageViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/20.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "SelectOverlayImageViewController.h"
#import "SelectOverlayImageCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface SelectOverlayImageViewController ()

@end

@implementation SelectOverlayImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.photos = [NSMutableArray array];
        self.groups = [NSMutableArray array];
        __weak SelectOverlayImageViewController *weakSelf = self;
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
    [self.collectionView registerNib:[UINib nibWithNibName:@"SelectOverlayImageCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"binding_dark.png"]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SelectOverlayImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) cell = [[SelectOverlayImageCell alloc] init];
    NSDictionary *dictionary = self.photos[indexPath.row];
    ALAsset *asset = [dictionary objectForKey:@"asset"];
    UIImage *thumbnail = [dictionary objectForKey:@"thumbnail"];
    cell.overlayImageVC = self;
    [cell setAsset:asset];
    [cell setImage:thumbnail];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
