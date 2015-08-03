//
//  ChangeColorDelegate.h
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ChangeColorDelegate <NSObject>

- (void)changeColor:(UIColor *)color;

@end
