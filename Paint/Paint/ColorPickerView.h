//
//  ColorPickerView.h
//  Paint
//
//  Created by LLDM on 13/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "BaseView.h"

@protocol ColorPickerDelegate;

@interface ColorPickerView : BaseView

@property (nonatomic) id <ColorPickerDelegate> colorPickerDelegate;
+ (void)selectColorBox:(UIButton *)colorNum;
+ (void)deSelectColorBox:(UIButton *)colorNum;

@end


@protocol ColorPickerDelegate <NSObject>

- (IBAction)pickColorNum:(id)sender;
- (IBAction)colorChange:(id)sender;

@end