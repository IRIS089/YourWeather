//
//  WRCLocation.h
//  YourWeather
//
//  Created by William Cleeton on 7/14/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WRCLocation : NSObject
{
    NSString *cityName;
    NSString *countryName;
    NSString *zipcode;
    NSString *stateName;
}

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *countryName;
@property (nonatomic, copy) NSString *zipCode;
@property (nonatomic, copy) NSString *stateName;

+(id)locationWithCityName:(NSString *)locationCityName andStateName:(NSString *)locationStateName andCountryName:(NSString *)locationCountryName andZipCode:(NSString *)locationZipCode;

@end
