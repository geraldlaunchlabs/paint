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
@property (nonatomic) IBOutlet UIView *colorPreview;
@end


@protocol ColorPickerDelegate <NSObject>

- (IBAction)colorChange:(id)sender;

@end