//
//  PaintViewController.h
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "BaseViewController.h"
#import "PaintView.h"
#import <QuartzCore/QuartzCore.h>

@interface PaintViewController : BaseViewController <PaintViewDelegate> {
    PaintView *paintView;
    NSMutableArray *lines;
    CGPoint pointA, pointB;
    BOOL activeLine;
    int tool;
}

@end
