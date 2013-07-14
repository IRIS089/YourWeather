//
//  WRCLocation.m
//  YourWeather
//
//  Created by William Cleeton on 7/14/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "WRCLocation.h"

@implementation WRCLocation

@synthesize cityName, countryName, zipCode, stateName;

+(id)locationWithCityName:(NSString *)locationCityName andStateName:(NSString *)locationStateName andCountryName:(NSString *)locationCountryName andZipCode:(NSString *)locationZipCode 
{
    WRCLocation *newLocation = [[self alloc] init];
    newLocation.cityName = locationCityName;
    newLocation.countryName = locationCountryName;
    newLocation.zipCode = locationZipCode;
    newLocation.stateName = locationStateName;
    
    return newLocation;
}

@end
