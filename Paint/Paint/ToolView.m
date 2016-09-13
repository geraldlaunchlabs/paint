//
//  ToolView.m
//  Paint
//
//  Created by LLDM on 13/09/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "ToolView.h"

@implementation ToolView


- (id)initWithTools:(NSArray *)tools {
    if ((self = [super init])) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *prevTool = self;
        
        for(int i=0; i<tools.count;) {
            UIButton *tool = [UIButton new];
            tool.translatesAutoresizingMaskIntoConstraints = NO;
            [tool setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",tools[i][@"tool"]]] forState:UIControlStateNormal];
            tool.imageView.contentMode = UIViewContentModeScaleAspectFit;
            [tool setTitle:tools[i][@"tool"] forState:UIControlStateNormal];
            tool.tag = ++i;
            [self addSubview:tool];
            
            //NSLog(@"\n\n\n%d",i);
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:tool
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:tool
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:0]];
            
            if(i == 1)
                [self addConstraint:[NSLayoutConstraint constraintWithItem:tool
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:0]];
            
            else {
                [self addConstraint:[NSLayoutConstraint constraintWithItem:tool
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:prevTool
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:0]];
                
                [self addConstraint:[NSLayoutConstraint constraintWithItem:prevTool
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tool
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:0]];
            }
            
            if(i == tools.count)
                [self addConstraint:[NSLayoutConstraint constraintWithItem:tool
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:0]];
            
            prevTool = tool;
        }
    }
    return self;
}

@end