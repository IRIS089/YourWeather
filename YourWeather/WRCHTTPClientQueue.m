//
//  YWHTTPClient.m
//  YourWeather
//
//  Created by William Cleeton on 7/13/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "WRCHTTPClientQueue.h"
#import "WRCDefinitions.h"

static WRCHTTPClientQueue *_sharedQueue = nil;

@implementation WRCHTTPClientQueue

+(WRCHTTPClientQueue *)sharedQueue
{
    @synchronized([WRCHTTPClientQueue class]){
        if (!_sharedQueue){
            _sharedQueue = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL_STRING]];
        }
        
        return _sharedQueue;
    }
    
    return nil;
}

@end
