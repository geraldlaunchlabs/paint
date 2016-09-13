//
//  BaseView.m
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
@synthesize baseViewDelegate = _baseViewDelegate;

#define MIN_RGB_STRING_LENGTH 6
#define RED_VALUE_INDEX 0
#define GREEN_VALUE_INDEX 2
#define BLUE_VALUE_INDEX 4
#define RGB_VALUE_LENGTH 2

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupLayout {
    
}

+ (UIColor *)colorWithHexString:(NSString *)hex {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 characters
    if ([cString length] < MIN_RGB_STRING_LENGTH){
        return [UIColor grayColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    
    if ([cString length] != MIN_RGB_STRING_LENGTH){
        return  [UIColor grayColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.length = RGB_VALUE_LENGTH;
    range.location = RED_VALUE_INDEX;
    NSString *rString = [cString substringWithRange:range];
    range.location = GREEN_VALUE_INDEX;
    NSString *gString = [cString substringWithRange:range];
    range.location = BLUE_VALUE_INDEX;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (void)setUINaviagtionBar:(UINavigationBar *)navBar barTintColor:(UIColor *)barTintColor tintColor:(UIColor *)tintColor translucent:(BOOL)trans {
    navBar.barTintColor = barTintColor;
    navBar.tintColor = tintColor;
    navBar.translucent = trans;
}

+ (UIColor *)changeOpacity:(UIColor*)color amount:(CGFloat)amount {
    CGFloat hue, saturation, brightness, alpha;
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        alpha += (amount-1.0);
        alpha = MAX(MIN(alpha, 1.0), 0.0);
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    }
    
    CGFloat white;
    if ([color getWhite:&white alpha:&alpha]) {
        white += (amount-1.0);
        white = MAX(MIN(white, 1.0), 0.0);
        return [UIColor colorWithWhite:white alpha:alpha];
    }
    return nil;
}


@end
