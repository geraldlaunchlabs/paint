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
    color1 = [UIColor blackColor];
    color2 = [UIColor blackColor];
    newDrawing = NO;
}

- (void)setupPaintViewWithTools:(NSArray *)tools {
    canvass = [UIView new];
    canvass.translatesAutoresizingMaskIntoConstraints = NO;
    canvass.backgroundColor = [UIColor whiteColor];
    [self addSubview:canvass];
    
    colorPickerView = [ColorPickerView new];
    colorPickerView.translatesAutoresizingMaskIntoConstraints = NO;
    colorPickerView.backgroundColor = [BaseView colorWithHexString:@"505050"];
    [self addSubview:colorPickerView];
    
    toolView = [[ToolView alloc]initWithTools:tools];
    toolView.translatesAutoresizingMaskIntoConstraints = NO;
    toolView.backgroundColor = colorPickerView.backgroundColor;
    [self addSubview:toolView];
    
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
    drawing.strokeColor = color1.CGColor;
    drawing.lineWidth = 0.9;
    drawing.fillColor = color2.CGColor;
    drawing.fillRule = kCAFillRuleEvenOdd;
    [canvass.layer addSublayer:drawing];
}

- (void)pencilTool {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(pointB.x,pointB.y)];
    [path addLineToPoint:CGPointMake(pointA.x,pointA.y)];
    
    pointA = pointB;
    
    [self drawWithPath:path.CGPath];
    
    [self reDraw];
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//    [path moveToPoint:CGPointMake(pointA.x,pointA.y)];
//    [path addLineToPoint:CGPointMake(pointB.x,pointA.y)];
//    [path addLineToPoint:CGPointMake(pointB.x,pointB.y)];
//    [path addLineToPoint:CGPointMake(pointA.x,pointB.y)];
//    [path addLineToPoint:CGPointMake(pointA.x,pointA.y)];
//    
//    
//    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    
//    [path2 moveToPoint:CGPointMake(pointA.x+10,pointA.y+10)];
//    [path2 addLineToPoint:CGPointMake(pointB.x-10,pointA.y+10)];
//    [path2 addLineToPoint:CGPointMake(pointB.x-10,pointB.y-10)];
//    [path2 addLineToPoint:CGPointMake(pointA.x+10,pointB.y-10)];
//    [path2 addLineToPoint:CGPointMake(pointA.x+10,pointA.y+10)];
//    
//    [path appendPath:path2];
//    [path setUsesEvenOddFillRule:YES];

    
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
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        
        
        
        
        
        
        
        
        int x = pointA.x, y = pointA.y;
        char direction = 'd';
        
        while([[self colorOfPoint:CGPointMake(x,--y)] isEqual:pointColor]);
        CGPoint startPoint = CGPointMake(x,++y);
        [path moveToPoint:startPoint];
        NSLog(@"\nstarting\nx: %d\ny: %d",x,y);
        do {
            NSLog(@"\n\n\ndirection %c",direction);
            switch (direction) {
                case 'u':
                    if([[self colorOfPoint:CGPointMake(x-1,y)] isEqual:pointColor]) {
                        [path addLineToPoint:CGPointMake(x--,y)];
                        direction = 'l';
                    } else if([[self colorOfPoint:CGPointMake(x,y-1)] isEqual:pointColor]) {
                        y--;
                    } else if (x+1 < canvass.frame.size.width) {
                        [path addLineToPoint:CGPointMake(x++,y)];
                        direction = 'r';
                    }
                    else {
                        [path addLineToPoint:CGPointMake(x,y++)];
                        direction = 'd';
                    }
                    break;
                    
                case 'd':
                    
                    
                    NSLog(@"\n\npointColor: %@\nthisColor: %@",pointColor,[self colorOfPoint:CGPointMake(x+1,y)]);
                    if([[self colorOfPoint:CGPointMake(x+1,y)] isEqual:pointColor]) {
                        
                        [path addLineToPoint:CGPointMake(x++,y)];
                        direction = 'r';
                    } else if([[self colorOfPoint:CGPointMake(x,y+1)] isEqual:pointColor]) {
                        y++;
                    } else if (x-1 > 0) {
                        [path addLineToPoint:CGPointMake(x--,y)];
                        direction = 'l';
                    }
                    else {
                        [path addLineToPoint:CGPointMake(x,y--)];
                        direction = 'u';
                    }
                    NSLog(@"\n %c",direction);
                    
                    break;
                    
                case 'r':
                    if([[self colorOfPoint:CGPointMake(x,y-1)] isEqual:pointColor]) {
                        [path addLineToPoint:CGPointMake(x,y--)];
                        direction = 'u';
                    } else if([[self colorOfPoint:CGPointMake(x+1,y)] isEqual:pointColor]) {
                        x++;
                    } else if (y+1 < canvass.frame.size.height) {
                        [path addLineToPoint:CGPointMake(x,y++)];
                        direction = 'd';
                    }
                    else {
                        [path addLineToPoint:CGPointMake(x--,y)];
                        direction = 'l';
                    }
                    break;
                    
                case 'l':
                    if([[self colorOfPoint:CGPointMake(x,y+1)] isEqual:pointColor]) {
                        [path addLineToPoint:CGPointMake(x,y++)];
                        direction = 'd';
                    } else if([[self colorOfPoint:CGPointMake(x-1,y)] isEqual:pointColor]) {
                        x--;
                    } else if (y-1 > 0) {
                        [path addLineToPoint:CGPointMake(x,y--)];
                        direction = 'u';
                    }
                    else {
                        [path addLineToPoint:CGPointMake(x++,y)];
                        direction = 'r';
                    }
                    break;
            }
            
            NSLog(@"\n\nx: %d\ny: %d",x,y);
            
        } while(startPoint.x!=x || startPoint.y!=y);
        
        
        
        
        
        
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

- (void)setColor1:(UIColor *)thisColor {
    color1 = thisColor;
}

- (void)setColor2:(UIColor *)thisColor {
    color2 = thisColor;
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
