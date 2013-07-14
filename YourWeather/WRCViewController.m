//
//  YWViewController.m
//  YourWeather
//
//  Created by William Cleeton on 7/13/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "WRCViewController.h"
#import "WRCJSONPraser.h"
#import "WRCTableViewController.h"

@interface WRCViewController ()

@property (nonatomic, strong) NSArray *locationArray;
@property (nonatomic, strong) NSMutableArray *filteredLocationArray;
@property IBOutlet UISearchBar *locationSearchBar;

@end

@implementation WRCViewController

@synthesize locationSearchBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    WRCJSONPraser *praser = [[WRCJSONPraser alloc] init];
    [praser requestJSONWithSearchParameter:@"London,uk"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)locationButtonPressed:(id)sender
{
    
}

-(IBAction)searchLocationButtonPressed:(id)sender
{
    // Search Bar is initally hidden.
    // Allows users to realize search feature is available.
    [locationSearchBar becomeFirstResponder];}
@end
