//
//  UIColor+UIColor_colorWithHexStr.h
//  Papyrus
//
//  Created by Arun Benty on 1/25/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (colorWithHexStr)

+ (UIColor *) colorWithHexStr: (NSString *) hexString ;
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;
+ (BOOL)isLightColorWithColor:(UIColor*)color;
+ (BOOL)isLightColorWithHexString: (NSString *) hexString;
+ (UIColor *)averageColor:(UIImage*)image;
+ (UIColor *)colorAtPixel:(CGPoint)point image:(UIImage*)image;
+ (NSString *)hexStringFromColor:(UIColor *)color;
+ (unsigned)getIntValueFromColor:(UIColor*)color;
@end



