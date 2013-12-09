//
//  AppDelegate.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "AppDelegate.h"
#import "InitialViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    InitialViewController *initVC  = [[InitialViewController alloc] initWithNibName:@"InitialViewController" bundle:nil];
    ViewControllerManager *manager = [[ViewControllerManager alloc] initWithRootViewController:initVC];
    self.window.rootViewController = manager;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
