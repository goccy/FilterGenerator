//
//  ExportViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/18.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "ExportViewController.h"
#define SERVER_HOST "http://localhost:9000/save_filter_parameter"

@interface ExportViewController ()

@end

@implementation ExportViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (void)export
{
    NSDictionary *filterParameters = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"filterParameters"];
    if([NSJSONSerialization isValidJSONObject:filterParameters]){
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:filterParameters options:NSJSONWritingPrettyPrinted error:&error];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:data];
        [request setURL:[NSURL URLWithString:@(SERVER_HOST)]];
        (void)[[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
