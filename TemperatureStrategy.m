//
//  TemperatureStrategy.m
//  Papyrus
//
//  Created by Joseph Gerald J on 04/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import "TemperatureStrategy.h"
#import "UnitConverterTypes.h"

@implementation TemperatureStrategy

+ (double)convertToCelcius:(NSString*)from InputValue:(double)input
{
    if ([from isEqualToString:TEMPERATURE_FAHRENHEIT]) {
        return (double) ((input - 32) * 5 / 9);
    } else if ([from isEqualToString:TEMPERATURE_KELVIN]) {
        return (double) (input - 273.15);
    }
    return 0.0;
}

+ (NSMutableArray*)getResult:(double)celcius
{
    NSMutableArray* arrResult = [[NSMutableArray alloc] init];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:TEMPERATURE_FAHRENHEIT UnitValue:[NSString stringWithFormat:@"%.2f",(double) ((celcius * 9 / 5) + 32)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:TEMPERATURE_CELCIUS UnitValue:[NSString stringWithFormat:@"%.2f",celcius]]];
    //[arrResult addObject:[UnitConvertResultData CreateConvertionResult:TEMPERATURE_KELVIN UnitValue:[NSString stringWithFormat:@"%.2f",(celcius + 273.15)]]];
    
    return arrResult;
}

+ (NSMutableArray*)convert:(NSString*)from InputValue:(double)input
{
    input = ([from isEqualToString:TEMPERATURE_CELCIUS]) ? input : [self convertToCelcius:from InputValue:input];
    return [self getResult:input];
}

@end
