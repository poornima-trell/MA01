//
//  LengthStrategy.m
//  Papyrus
//
//  Created by Joseph Gerald J on 04/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import "LengthStrategy.h"
#import "UnitConverterTypes.h"

@implementation LengthStrategy

+ (double)convertToCentimtre:(NSString*)from InputValue:(double)input
{
    if ([from isEqualToString:LENGTH_CENTIMETRE]) {
        return input;
    }else if ([from isEqualToString:LENGTH_FEET]) {
        return input * 30.48;
    } else if ([from isEqualToString:LENGTH_INCH]) {
        return input * 2.54;
    } else if ([from isEqualToString:LENGTH_KILOMETRE]) {
        return input * 100000.0;
    } else if ([from isEqualToString:LENGTH_METRE]) {
        return input * 100.0;
    } else if ([from isEqualToString:LENGTH_MILE]) {
        return input * 160934;
    } else if ([from isEqualToString:LENGTH_MILLIMETRE]) {
        return input / 10;
    }
    
    return input;
}

+ (NSMutableArray*)getResult:(double)centimetre
{
    NSMutableArray* arrResult = [[NSMutableArray alloc] init];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:LENGTH_CENTIMETRE UnitValue:[NSString stringWithFormat:@"%.2f",centimetre]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:LENGTH_FEET UnitValue:[NSString stringWithFormat:@"%.2f",(centimetre * 0.03281)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:LENGTH_INCH UnitValue:[NSString stringWithFormat:@"%.2f",(centimetre * 0.39370)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:LENGTH_KILOMETRE UnitValue:[NSString stringWithFormat:@"%.2f",(centimetre * 0.00001)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:LENGTH_METRE UnitValue:[NSString stringWithFormat:@"%.2f",(centimetre * 0.01000)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:LENGTH_MILE UnitValue:[NSString stringWithFormat:@"%.2f",(centimetre / 160934)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:LENGTH_MILLIMETRE UnitValue:[NSString stringWithFormat:@"%.2f",(centimetre * 10)]]];
    
    return arrResult;
}

+ (NSMutableArray*)convert:(NSString*)from InputValue:(double)input
{
    input = [self convertToCentimtre:from InputValue:input];
    return [self getResult:input];
}

@end
