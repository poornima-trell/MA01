//
//  UnitConvertResultData.h
//  Papyrus
//
//  Created by Joseph Gerald J on 05/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnitConvertResultData : NSObject

@property (strong, nonatomic) NSString* UnitName;
@property (strong, nonatomic) NSString* UnitValue;

- (instancetype)initWithData:(NSString*)unitName UnitValue:(NSString*)unitValue NS_DESIGNATED_INITIALIZER;
+ (id)CreateConvertionResult:(NSString*)unitName UnitValue:(NSString*)unitValue;

@end
