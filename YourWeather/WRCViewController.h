//
//  YWViewController.h
//  YourWeather
//
//  Created by William Cleeton on 7/13/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRCViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate>



-(IBAction)locationButtonPressed:(id)sender;
-(IBAction)searchLocationButtonPressed:(id)sender;

@end
