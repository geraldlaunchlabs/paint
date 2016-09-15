//
//  BaseView.h
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewDelegate;

@interface BaseView : UIView

@property (nonatomic) id <BaseViewDelegate> baseViewDelegate;

- (void)setupLayout;
+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (void)setUINaviagtionBar:(UINavigationBar *)navBar barTintColor:(UIColor *)barTintColor tintColor:(UIColor *)tintColor translucent:(BOOL)trans;
+ (UIColor *)changeOpacity:(UIColor*)color amount:(CGFloat)amount;
- (UIColor *) colorOfPoint:(CGPoint)point;

@end

@protocol BaseViewDelegate <NSObject>

@end