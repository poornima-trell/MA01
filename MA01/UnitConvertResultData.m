//
//  UnitConvertResultData.m
//  Papyrus
//
//  Created by Joseph Gerald J on 05/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import "UnitConvertResultData.h"

@implementation UnitConvertResultData

@synthesize UnitName, UnitValue;

- (instancetype)initWithData:(NSString*)unitName UnitValue:(NSString*)unitValue
{
    self = [super init];
    
    if (self) {
        self.UnitName = unitName;
        self.UnitValue = unitValue;
    }
    
    return self;
}

+ (id)CreateConvertionResult:(NSString*)unitName UnitValue:(NSString*)unitValue
{
    id obj = [[self alloc] initWithData:unitName UnitValue:unitValue];
    return obj;
}

@end
