//
//  ColorPickerView.m
//  Paint
//
//  Created by LLDM on 13/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "ColorPickerView.h"

@implementation ColorPickerView

@synthesize colorPickerDelegate,colorPreview;

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
        
        colorPreview = [UIView new];
        colorPreview.translatesAutoresizingMaskIntoConstraints = NO;
        colorPreview.backgroundColor = [UIColor blackColor];
        colorPreview.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.6,0.6);
        colorPreview.tag = 4;
        [self addSubview:colorPreview];


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
                                                            toItem:colorPreview
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPreview
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:b
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPreview
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:b
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPreview
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPreview
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:colorPreview
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1
                                                          constant:0]];
    }
    return self;
}

@end
