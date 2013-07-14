//
//  WRCJSONPraser.m
//  YourWeather
//
//  Created by William Cleeton on 7/14/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "WRCJSONPraser.h"
#import "WRCHTTPClientQueue.h"
#import "WRCDefinitions.h"
#import "AFJSONRequestOperation.h"

@interface WRCJSONPraser ()

@property (nonatomic, strong) NSDictionary *retrievedJSON;

@end

@implementation WRCJSONPraser

@synthesize retrievedJSON;

-(void)requestJSONWithSearchParameter:(NSString *)searchCityParameter
{
    NSString *searchByCity = [NSString stringWithFormat:@"%@", searchCityParameter];
    NSURLRequest *request = [[WRCHTTPClientQueue sharedQueue] requestWithMethod:GET_METHOD path:WEATHER_PATH parameters:@{@"q": searchByCity}];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        self.retrievedJSON = JSON;        
            } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Weather could not be retrieved." message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
    }];
    
    [[WRCHTTPClientQueue sharedQueue] enqueueHTTPRequestOperation:operation];
}

-(void)praseJSONDictionary:(NSDictionary *)JSONDictionary
{
    
}

@end
