//
//  WRCTableViewController.m
//  YourWeather
//
//  Created by William Cleeton on 7/14/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "WRCTableViewController.h"
#import "WRCLocation.h"

@interface WRCTableViewController ()

@end

@implementation WRCTableViewController

@synthesize locationArray, filteredLocationArray, locationSearchBar;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self populateLocationArray];
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + locationSearchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
    
    // Filtered location array cannot be bigger than location array.
    self.filteredLocationArray = [NSMutableArray arrayWithCapacity:[locationArray count]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)populateLocationArray
{
    locationArray = @[[WRCLocation locationWithCityName:@"London" andStateName:nil andCountryName:@"uk" andZipCode:nil],
                      [WRCLocation locationWithCityName:@"Columbia" andStateName:@"mo" andCountryName:@"U.S.A." andZipCode:nil],
                      [WRCLocation locationWithCityName:@"Saint Louis" andStateName:@"mo" andCountryName:@"U.S.A." andZipCode:nil]];
    
}

#pragma mark - TableView Delegate

-(NSInteger *)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger *arrayCount = 0;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        arrayCount = [filteredLocationArray count];
    } else {
        arrayCount = [locationArray count];
    }
    
    return arrayCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Create a new location object.
    WRCLocation *location = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        location = [filteredLocationArray objectAtIndex:indexPath.row];
    } else {
        location = [locationArray objectAtIndex:indexPath.row];
    }
    // Configure the cell.
    cell.textLabel.text = location.cityName;
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Perform segue to weather view showing the weather for the location selected.
    [self performSegueWithIdentifier:@"weatherDetail" sender:tableView];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"weatherDetail"]) {
        UIViewController *weatherMainViewController = [segue destinationViewController];
        // Check to see if city selection came from search or normal tableView.
        if (sender == self.searchDisplayController.searchResultsTableView) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *weatherCityTitle = [[filteredLocationArray objectAtIndex:[indexPath row]] cityName];
            [weatherMainViewController setTitle:weatherCityTitle];
        } else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *weatherCityTitle = [[locationArray objectAtIndex:[indexPath row]] cityName];
            [weatherMainViewController setTitle:weatherCityTitle];
        }
    }
}



#pragma mark - Content Filtering

-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    // Inserts filtered content into filteredLocationArray.
    // Remove all objects from filteredLocationArray for new search content.
    [self.filteredLocationArray removeAllObjects];
    
    // Filter filteredLocationArray using NSPredicate.
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.cityName contains[c] %@", searchText];
    NSArray *tempArray = [locationArray filteredArrayUsingPredicate:predicate];
 
    filteredLocationArray = [NSMutableArray arrayWithArray:tempArray];
}

#pragma mark - UISeachDisplayController Delegate

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{ 
    // Inform table data source to reload when text changes.
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause table data source to reload.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    // Inform table data source to reload when scope bar selection changes.
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause table data source to reload.
    return YES;
}

#pragma mark - Actions

-(IBAction)searchNewLocation:(id)sender
{
    // Search Bar is initally hidden.
    // Allows users to realize search feature is available.
    [locationSearchBar becomeFirstResponder];
}

@end