//
//  LengthStrategy.h
//  Papyrus
//
//  Created by Joseph Gerald J on 04/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LengthStrategy : NSObject

+ (double)convertToCentimtre:(NSString*)from InputValue:(double)input;
+ (NSMutableArray*)getResult:(double)centimetre;
+ (NSMutableArray*)convert:(NSString*)from InputValue:(double)input;

@end
