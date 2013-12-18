//
//  InitialViewContollerViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "InitialViewController.h"
#import "ExportViewController.h"

@implementation InitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tableParameters = [[NSMutableArray alloc] init];
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"binding_dark.png"]];
        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"debut_light.png"]];
        self.tableView.layer.cornerRadius = 5;
        self.tableView.clipsToBounds = true;
        self.createFilterButton.layer.cornerRadius = 0;
        self.createFilterButton.clipsToBounds = true;
        self.title = @"Manage Filter";
        UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Export" style:UIBarButtonItemStyleDone
                                                                     target:self
                                                                     action:@selector(touchExportButton:)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSDictionary *savedParameters = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"filterParameters"];
    for (NSString *codeName in [savedParameters allKeys]) {
        NSDictionary *params = [savedParameters objectForKey:codeName];
        if (![self.tableParameters containsObject:params]) [self.tableParameters addObject:params];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchDownButton:(id)sender
{
    EditViewController *editVC = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    ViewControllerManager *manager = [self manager];
    [manager pushViewController:editVC animated:YES];
}

- (IBAction)touchExportButton:(id)sender
{
    [ExportViewController export];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    NSDictionary *param = self.tableParameters[indexPath.row];
    cell.textLabel.text = [NSString stringWithCString:[[param objectForKey:@"name"] UTF8String] encoding:NSUTF8StringEncoding];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    NSDictionary *param = self.tableParameters[index];
    NSDictionary *filterParameter = [param objectForKey:@"body"];
    EditViewController *editVC = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    editVC.filterParameter = [NSMutableDictionary dictionaryWithDictionary:filterParameter];
    ViewControllerManager *manager = [self manager];
    [manager pushViewController:editVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableParameters count];
}


@end
