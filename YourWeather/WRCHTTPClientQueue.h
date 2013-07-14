//
//  YWHTTPClient.h
//  YourWeather
//
//  Created by William Cleeton on 7/13/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "AFHTTPClient.h"

@interface WRCHTTPClientQueue : AFHTTPClient

+(WRCHTTPClientQueue *)sharedQueue;


@end
