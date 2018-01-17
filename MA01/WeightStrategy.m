//
//  WeightStrategy.m
//  Papyrus
//
//  Created by Joseph Gerald J on 04/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import "WeightStrategy.h"
#import "UnitConverterTypes.h"

@implementation WeightStrategy

+ (double)convertToGrams:(NSString*)from InputValue:(double)input
{
    if ([from isEqualToString:WEIGHT_GRAM]) {
        return input;
    }else if ([from isEqualToString:WEIGHT_KILOGRAM]) {
        return input * 1000;
    } else if ([from isEqualToString:WEIGHT_POUND]) {
        return input * 453.592;
    } else if ([from isEqualToString:WEIGHT_MILLIGRAM]) {
        return input * 0.001;
    } else if ([from isEqualToString:WEIGHT_OUNCE]) {
        return input * 28.3495;
    }
    
    return input;
}

+ (NSMutableArray*)getResult:(double)grams
{
    NSMutableArray* arrResult = [[NSMutableArray alloc] init];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:WEIGHT_GRAM UnitValue:[NSString stringWithFormat:@"%.2f",grams]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:WEIGHT_KILOGRAM UnitValue:[NSString stringWithFormat:@"%.2f",(grams * 0.001)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:WEIGHT_POUND UnitValue:[NSString stringWithFormat:@"%.2f",(grams * 0.0022046244201837776)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:WEIGHT_MILLIGRAM UnitValue:[NSString stringWithFormat:@"%.2f",(grams * 1000.0000000000001)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:WEIGHT_OUNCE UnitValue:[NSString stringWithFormat:@"%.2f",(grams * 0.03527399072294044)]]];
    
    return arrResult;
}

+ (NSMutableArray*)convert:(NSString*)from InputValue:(double)input
{
    input = [self convertToGrams:from InputValue:input];
    return [self getResult:input];
}

@end
