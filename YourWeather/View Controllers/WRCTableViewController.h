//
//  WRCTableViewController.h
//  YourWeather
//
//  Created by William Cleeton on 7/14/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRCTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSArray *locationArray;
@property (nonatomic, strong) NSMutableArray *filteredLocationArray;
@property IBOutlet UISearchBar *locationSearchBar;

-(IBAction)searchNewLocation:(id)sender;
@end
