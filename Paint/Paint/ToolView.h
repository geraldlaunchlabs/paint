//
//  ToolView.h
//  Paint
//
//  Created by LLDM on 13/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "BaseView.h"

@protocol ToolViewDelegate;

@interface ToolView : BaseView

@property (nonatomic) id <ToolViewDelegate> toolViewDelegate;
- (id)initWithTools:(NSArray *)tools;

@end


@protocol ToolViewDelegate <NSObject>

- (IBAction)toolChange:(id)sender;

@end