//
//  VolumeStrategy.h
//  Papyrus
//
//  Created by Joseph Gerald J on 04/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VolumeStrategy : NSObject

+ (double)convertToCubicCentimetre:(NSString*)from InputValue:(double)input;
+ (NSMutableArray*)getResult:(double)cubicCentimetre;
+ (NSMutableArray*)convert:(NSString*)from InputValue:(double)input;

@end
