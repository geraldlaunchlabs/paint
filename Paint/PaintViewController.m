//
//  PaintViewController.m
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "PaintViewController.h"

@interface PaintViewController ()

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
    
    [paintView setupLayout];
    [paintView setupToolBar:[self getTools]];
    
    self.view = paintView;
}

- (void)viewDidAppear:(BOOL)animated {
    [BaseView setUINaviagtionBar:self.navigationController.navigationBar
                    barTintColor:[BaseView colorWithHexString:@"0352B6"]
                       tintColor:[UIColor whiteColor]
                     translucent:NO];
}

- (NSArray *)getTools{
    NSArray *tools = [NSArray arrayWithObjects:
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      @"pencil",@"tool",
                      @"pencil.png",@"icon",
                      nil],
                     
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      @"rectangle",@"tool",
                      @"rectangle.png",@"icon",
                      nil],
                     
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      @"circle",@"tool",
                      @"circle.png",@"icon",
                      nil],
                     nil];
    return tools;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    pointA = [touch locationInView:self.view];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    pointB = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    pointB = [touch locationInView:self.view];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(pointB.x,pointB.y)];
    [path addLineToPoint:CGPointMake(pointA.x,pointA.y)];
    pointA=pointB;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    shapeLayer.lineWidth = 3.0;
    shapeLayer.fillColor = [[UIColor redColor] CGColor];
    [self.view.layer addSublayer:shapeLayer];
    [self.view setNeedsDisplay];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
