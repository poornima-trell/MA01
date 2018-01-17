//
//  VolumeStrategy.m
//  Papyrus
//
//  Created by Joseph Gerald J on 04/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import "VolumeStrategy.h"
#import "UnitConverterTypes.h"

@implementation VolumeStrategy

+ (double)convertToCubicCentimetre:(NSString*)from InputValue:(double)input
{
    if ([from isEqualToString:VOLUME_CUBIC_CENTIMETRE]) {
        return input;
    }else if ([from isEqualToString:VOLUME_CUBIC_FOOT]) {
        return input * 28316.8;
    } else if ([from isEqualToString:VOLUME_CUBIC_METRE]) {
        return input * 1000000;
    } else if ([from isEqualToString:VOLUME_CUBIC_MILLIMETRE]) {
        return input * 0.001;
    } else if ([from isEqualToString:VOLUME_LITRE]) {
        return input * 1000.0000000000001;
    } else if ([from isEqualToString:VOLUME_MILLILITRE]) {
        return input * 1;
    } else if ([from isEqualToString:VOLUME_US_GALLON]) {
        return input * 3785.41;
    } else if ([from isEqualToString:VOLUME_US_PINT]) {
        return input * 473.17600000000004;
    } else if ([from isEqualToString:VOLUME_US_QUART]) {
        return input * 946.352946;
    } else if ([from isEqualToString:VOLUME_TEASPOON]) {
        return input * 4.92892159;
    } else if ([from isEqualToString:VOLUME_TABLESPOON]) {
        return input * 14.7867648;
    } else if ([from isEqualToString:VOLUME_FLUID_OUNCES]) {
        return input * 29.5735296;
    } else if ([from isEqualToString:VOLUME_CUPS]) {
        return input * 236.588236;
    }
    
    return input;
}

+ (NSMutableArray*)getResult:(double)cubicCentimetre
{
    NSMutableArray* arrResult = [[NSMutableArray alloc] init];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_TEASPOON UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 0.202884136)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_TABLESPOON UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 0.0676280454)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_CUPS UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 0.00422675284)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_MILLILITRE UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 1)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_FLUID_OUNCES UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 0.03381402)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_LITRE UnitValue:[NSString stringWithFormat:@"%.2f",cubicCentimetre * 0.001]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_US_GALLON UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 0.00026417217685798894)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_US_PINT UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 0.002113378531455526)]]];
    [arrResult addObject:[UnitConvertResultData CreateConvertionResult:VOLUME_US_QUART UnitValue:[NSString stringWithFormat:@"%.2f",(cubicCentimetre * 0.0010566881491367386)]]];
    
    return arrResult;
}

+ (NSMutableArray*)convert:(NSString*)from InputValue:(double)input
{
    input = [self convertToCubicCentimetre:from InputValue:input];
    return [self getResult:input];
}

@end
