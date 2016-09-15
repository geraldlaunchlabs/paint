//
//  PaintViewController.h
//  Paint
//
//  Created by LLDM on 08/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "BaseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PaintView.h"
#import "ColorPickerView.h"

@interface PaintViewController : BaseViewController <PaintViewDelegate,ColorPickerDelegate> {
    PaintView *paintView;
    ColorPickerView *colorPicker;
}

@end
