//
//  SaveViewController.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/16.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "SaveViewController.h"
#import "EditViewController.h"

@interface SaveViewController ()

@end

@implementation SaveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeSoftKeyboard)];
        [self.view addGestureRecognizer:gestureRecognizer];
        self.filterNameArea.returnKeyType = UIReturnKeyDone;
        self.codeNameArea.returnKeyType   = UIReturnKeyDone;
    }
    return self;
}

- (void)closeSoftKeyboard {
    [self.view endEditing: YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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

- (BOOL)validateNames:(NSString *)filterName codeName:(NSString *)codeName
{
    if (!filterName || !codeName) return NO;
    return [self isHalfWidthAlphanumeric:codeName];
}

- (BOOL)isHalfWidthAlphanumeric:(NSString *)target
{
    NSMutableCharacterSet *checkCharSet = [[NSMutableCharacterSet alloc] init];
    [checkCharSet addCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    [checkCharSet addCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    [checkCharSet addCharactersInString:@"1234567890"];
    return ([[target stringByTrimmingCharactersInSet:checkCharSet] length] == 0) ? YES : NO;
}

- (IBAction)touchDoneButton:(id)sender
{
    NSString *filterName = self.filterNameArea.text;
    NSString *codeName   = self.codeNameArea.text;
    if ([self validateNames:filterName codeName:codeName]) {
        ViewControllerManager *manager = [self manager];
        NSArray *controllers = [manager viewControllers];
        EditViewController *editVC  = (EditViewController *)controllers[1];
        NSMutableDictionary *saveParameter   = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *filterParameter = editVC.filterParameter;
        if (![filterParameter count]) {
            NSLog(@"[ERROR] validate error. nothing filter's parameter");
            return;
        }
        [saveParameter setObject:filterName forKey:@"name"];
        [saveParameter setObject:filterParameter forKey:@"body"];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSDictionary *filterParameters = [userDefault dictionaryForKey:@"filterParameters"];
        NSMutableDictionary *dict;
        if (filterParameters) {
            dict = [NSMutableDictionary dictionaryWithDictionary:filterParameters];
            [dict setObject:saveParameter forKey:codeName];
        } else {
            dict = [[NSMutableDictionary alloc] init];
            [dict setObject:saveParameter forKey:codeName];
        }
        [userDefault setObject:dict forKey:@"filterParameters"];
        [self dismissViewControllerAnimated:YES completion:nil];
        [manager popToRootViewControllerAnimated:YES];
    } else {
        NSLog(@"[ERROR] validate error.");
    }
}

- (IBAction)touchCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
