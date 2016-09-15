//
//  PaintView.m
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView

@synthesize paintViewDelegate,toolView,colorPickerView,canvass;

- (void)setupLayout {
    color = [UIColor blackColor];
    newDrawing = NO;
}

- (void)setupPaintViewWithTools:(NSArray *)tools {
    canvass = [UIView new];
    canvass.translatesAutoresizingMaskIntoConstraints = NO;
    canvass.backgroundColor = [UIColor whiteColor];
    [self addSubview:canvass];
    
    toolView = [[ToolView alloc]initWithTools:tools];
    toolView.translatesAutoresizingMaskIntoConstraints = NO;
    toolView.backgroundColor = [BaseView colorWithHexString:@"505050"];
    [self addSubview:toolView];
    
    colorPickerView = [ColorPickerView new];
    colorPickerView.translatesAutoresizingMaskIntoConstraints = NO;
    colorPickerView.backgroundColor = toolView.backgroundColor;
    [self addSubview:colorPickerView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:toolView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:toolView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:toolView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:toolView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:30]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPickerView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:toolView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPickerView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:toolView
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPickerView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:toolView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:colorPickerView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:30]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:canvass
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:canvass
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:colorPickerView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:canvass
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:canvass
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0]];
}

- (void)undoDrawing {
    [[canvass.layer.sublayers lastObject]removeFromSuperlayer];
}

- (void)drawWithPath:(CGPathRef)path {
    CAShapeLayer *drawing = [CAShapeLayer layer];
    drawing.path = path;
    drawing.strokeColor = [color CGColor];
    drawing.lineWidth = 0.9;
    drawing.fillColor = [[UIColor clearColor] CGColor];
    [canvass.layer addSublayer:drawing];
}

- (void)pencilTool {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(pointB.x,pointB.y)];
    [path addLineToPoint:CGPointMake(pointA.x,pointA.y)];
    
    pointA = pointB;
    
    [self drawWithPath:path.CGPath];
}

- (void)lineTool {
    [self reDraw];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(pointB.x,pointB.y)];
    [path addLineToPoint:CGPointMake(pointA.x,pointA.y)];
    
    [self drawWithPath:path.CGPath];
}

- (void)rectangleTool {
    [self reDraw];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:[self getRectbyPoints]];
    
    [self drawWithPath:path.CGPath];
}

- (void)circleTool {
    [self reDraw];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:[self getRectbyPoints]];
    
    [self drawWithPath:path.CGPath];
}

- (void)fillTool {
    UIColor *pointColor = [self colorOfPoint:pointA];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(pointA.x,pointA.y)];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        for(int y=pointA.y; y<canvass.frame.size.height; y++) {
            
            
            if([[self colorOfPoint:CGPointMake(pointA.x,y)] isEqual:pointColor]) {
                [path addLineToPoint:CGPointMake(pointA.x,y)];
            } else break;
            
            
            for(int x=pointA.x; x<canvass.frame.size.width; x++) {
                if(![[self colorOfPoint:CGPointMake(x,y)] isEqual:pointColor] || x == canvass.frame.size.width-1) {
                    [path addLineToPoint:CGPointMake(x,y)];
                    NSLog(@"poinx: %i",x);
                    break;
                }
            }
        }
        
        dispatch_async(dispatch_get_main_queue(),^(void) {
            [self drawWithPath:path.CGPath];
        });
    });

    
    
    NSLog(@"\n\n\n%f\n%f",pointA.x,pointA.y);
    
}

- (void)reDraw {
    if(newDrawing) newDrawing = NO;
    else [self undoDrawing];
}

- (CGRect)getRectbyPoints {
    return CGRectMake(pointB.x,pointB.y,pointA.x-pointB.x,pointA.y-pointB.y);
}

- (void)setColor:(UIColor *)thisColor {
    color = thisColor;
}

- (void)setPointA:(CGPoint)point {
    pointA = point;
}

- (void)setPointB:(CGPoint)point {
    pointB = point;
}

- (void)newDrawing:(BOOL)ans {
    newDrawing = ans;
}

@end
