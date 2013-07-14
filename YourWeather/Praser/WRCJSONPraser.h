//
//  WRCJSONPraser.h
//  YourWeather
//
//  Created by William Cleeton on 7/14/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WRCJSONPraser : NSObject

-(void)requestJSONWithSearchParameter:(NSString *)searchCityParameter;
@end
