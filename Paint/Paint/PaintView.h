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
    NSMutableArray *lines;
    CGPoint pointA, pointB;
    BOOL activeLine;
    BaseView *tool;
}

@property (nonatomic) id <PaintViewDelegate> paintViewDelegate;

- (void)setTool:(int)selectedTool;
- (void)setupToolBar:(NSArray *)tools;

@end


@protocol PaintViewDelegate <NSObject>

@end