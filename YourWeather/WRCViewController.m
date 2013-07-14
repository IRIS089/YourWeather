//
//  YWViewController.m
//  YourWeather
//
//  Created by William Cleeton on 7/13/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "WRCViewController.h"
#import "WRCHTTPClientQueue.h"
#import "AFJSONRequestOperation.h"

@interface WRCViewController ()

@end

@implementation WRCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self testingOperation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testingOperation
{
    NSURLRequest *request = [[WRCHTTPClientQueue sharedQueue] requestWithMethod:@"GET" path:@"weather" parameters:@{@"q": @"London,uk"}];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"%@", JSON);
        NSLog(@"%@", [JSON valueForKeyPath:@"clouds.all"]);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"operation failed because %@", error);
    }];
    
    [[WRCHTTPClientQueue sharedQueue] enqueueHTTPRequestOperation:operation];
}

@end
