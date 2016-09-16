//
//  ColorPickerView.m
//  Paint
//
//  Created by LLDM on 13/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "ColorPickerView.h"

@implementation ColorPickerView

@synthesize colorPickerDelegate;

- (id)init {
    if ((self = [super init])) {
        UISlider *r = [UISlider new];
        r.translatesAutoresizingMaskIntoConstraints = NO;
        r.minimumValue = 0.0;
        r.maximumValue = 255.0;
        r.maximumTrackTintColor = [UIColor redColor];
        r.thumbTintColor = [UIColor blackColor];
        r.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.75,0.75);
        r.tag = 1;
        [r addTarget:colorPickerDelegate action:@selector(colorChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:r];
        
        UISlider *g = [UISlider new];
        g.translatesAutoresizingMaskIntoConstraints = NO;
        g.minimumValue = 0.0;
        g.maximumValue = 255.0;
        g.maximumTrackTintColor = [UIColor greenColor];
        g.thumbTintColor = [UIColor blackColor];
        g.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.75,0.75);
        g.tag = 2;
        [g addTarget:colorPickerDelegate action:@selector(colorChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:g];
        
        UISlider *b = [UISlider new];
        b.translatesAutoresizingMaskIntoConstraints = NO;
        b.minimumValue = 0.0;
        b.maximumValue = 255.0;
        b.maximumTrackTintColor = [UIColor blueColor];
        b.thumbTintColor = [UIColor blackColor];
        b.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.75,0.75);
        b.tag = 3;
        [b addTarget:colorPickerDelegate action:@selector(colorChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:b];
        
        UIButton *color1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        color1.translatesAutoresizingMaskIntoConstraints = NO;
        color1.backgroundColor = [UIColor blackColor];
        color1.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6,0.6);
        color1.layer.shadowColor = [UIColor whiteColor].CGColor;
        color1.layer.shadowRadius = 0;
        color1.layer.shadowOpacity = 0.9;
        color1.layer.shadowOffset = CGSizeZero;
        color1.layer.masksToBounds = NO;
        color1.tag = 4;
        [color1 addTarget:colorPickerDelegate action:@selector(pickColorNum:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:color1];
        
        UIButton *color2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        color2.translatesAutoresizingMaskIntoConstraints = NO;
        color2.backgroundColor = [UIColor blackColor];
        color2.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6,0.6);
        color2.layer.shadowColor = [UIColor whiteColor].CGColor;
        color2.layer.shadowRadius = 0;
        color2.layer.shadowOpacity = 0.9;
        color2.layer.shadowOffset = CGSizeZero;
        color2.layer.masksToBounds = NO;
        color2.tag = 5;
        [color2 addTarget:colorPickerDelegate action:@selector(pickColorNum:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:color2];


        [self addConstraint:[NSLayoutConstraint constraintWithItem:r
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:r
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:r
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:r
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:g
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:g
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:r
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:g
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:r
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:g
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:r
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:g
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:b
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:b
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:g
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:b
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:g
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:b
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:g
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:b
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:color1
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color1
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:b
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color1
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:b
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color1
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:b
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color1
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:color2
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color2
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:color1
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color2
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:color1
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color2
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:color2
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:color2
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1
                                                          constant:0]];
    }
    return self;
}

+ (void)selectColorBox:(UIButton *)colorBox {
    colorBox.layer.shadowRadius = 10.0;
}

+ (void)deSelectColorBox:(UIButton *)colorBox {
    colorBox.layer.shadowRadius = 0;
}

@end
