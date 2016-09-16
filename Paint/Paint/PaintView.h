//
//  PaintView.h
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "ToolView.h"
#import "ColorPickerView.h"

@protocol PaintViewDelegate;


@interface PaintView : BaseView {
    CGPoint pointA, pointB;
    UIColor *color1, *color2;
    BOOL newDrawing;
}

@property(nonatomic) id <PaintViewDelegate> paintViewDelegate;
@property(nonatomic) ToolView *toolView;
@property(nonatomic) ColorPickerView *colorPickerView;
@property(nonatomic) UIView *canvass;

- (void)setupPaintViewWithTools:(NSArray *)tools;
- (void)setColor1:(UIColor *)thisColor;
- (void)setColor2:(UIColor *)thisColor;
- (void)setPointA:(CGPoint)point;
- (void)setPointB:(CGPoint)point;
- (void)newDrawing:(BOOL)ans;

- (void)pencilTool;
- (void)lineTool;
- (void)rectangleTool;
- (void)circleTool;
- (void)fillTool;
- (void)undoDrawing;

@end


@protocol PaintViewDelegate <NSObject>

@end