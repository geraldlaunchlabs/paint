//
//  PaintViewController.m
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "PaintViewController.h"

@interface PaintViewController () {
    int tool;
    int colorNum;
}

@end

@implementation PaintViewController

- (void)loadView {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    paintView = [PaintView new];
    paintView.baseViewDelegate = self;
    paintView.paintViewDelegate = self;
    colorPicker.colorPickerDelegate = self;
    toolView.toolViewDelegate = self;
    
    [paintView setupLayout];
    [paintView setupPaintViewWithTools:[self getTools]];
    
    self.view = paintView;
}

- (void)viewDidAppear:(BOOL)animated {
    [BaseView setUINaviagtionBar:self.navigationController.navigationBar
                    barTintColor:[BaseView colorWithHexString:@"505050"]
                       tintColor:[UIColor whiteColor]
                     translucent:NO];
    
    colorNum = 4;
    tool = 1;
}

- (void)viewDidLayoutSubviews {
    [ColorPickerView selectColorBox:[paintView.colorPickerView viewWithTag:colorNum]];
    [ToolView selectToolButton:[paintView.toolView viewWithTag:1]];
}

- (NSArray *)getTools{
    NSArray *tools = @[@"pencil",@"line",@"rectangle",@"circle",@"fill",@"undo"];
    return tools;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    [paintView setPointA:[touch locationInView:paintView.canvass]];
    [paintView newDrawing:YES];
    if(tool == 5) [paintView fillTool];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    [paintView setPointB:[touch locationInView:paintView.canvass]];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    [paintView setPointB:[touch locationInView:paintView.canvass]];
    [self draw];
}

- (void)draw {
    switch(tool) {
        default: [paintView pencilTool];
            break;
        case 2: [paintView lineTool];
            break;
        case 3: [paintView rectangleTool];
            break;
        case 4: [paintView circleTool];
            break;
        case 5: break;
    }
}

#pragma mark - Pick Color Num

- (IBAction)pickColorNum:(id)sender {
    [ColorPickerView deSelectColorBox:[paintView.colorPickerView viewWithTag:colorNum]];
    colorNum = (int)((UIButton *)sender).tag;
    [ColorPickerView selectColorBox:[paintView.colorPickerView viewWithTag:colorNum]];
}

#pragma mark - Color Change

- (IBAction)colorChange:(id)sender {
    static float r = 0, g = 0, b = 0;
    UISlider *colorSlider = (UISlider *)sender;
    switch(colorSlider.tag) {
        case 1:
            r = colorSlider.value;
            colorSlider.thumbTintColor = [UIColor colorWithRed:r/255.0 green:0 blue:0 alpha:1];
            break;
        case 2:
            g = colorSlider.value;
            colorSlider.thumbTintColor = [UIColor colorWithRed:0 green:g/255.0 blue:0 alpha:1];
            break;
        case 3:
            b = colorSlider.value;
            colorSlider.thumbTintColor = [UIColor colorWithRed:0 green:0 blue:b/255.0 alpha:1];
            break;
        default:break;
    }
    
    colorSlider.tintColor = colorSlider.thumbTintColor;
    
    UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
    [paintView.colorPickerView viewWithTag:colorNum].backgroundColor = color;
    if(colorNum == 4) [paintView setColor1: color];
    else [paintView setColor2: color];
}

#pragma mark - Tool Change

- (IBAction)toolChange:(id)sender {
    static UIButton *prevTool = nil;
    if(prevTool == nil) prevTool = [paintView.toolView viewWithTag:tool];
    UIButton *selectedTool = (UIButton *)sender;
    if(selectedTool.tag == 6) [paintView undoDrawing];
    else {
        tool = (int)selectedTool.tag;
        [ToolView deSelectToolButton:prevTool];
        [ToolView selectToolButton:selectedTool];
        prevTool = (UIButton *)sender;
    }
}

@end
