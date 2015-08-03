//
//  ChangeColorBlockViewController.h
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeColorBlockViewController : UITableViewController

@property (nonatomic, copy) void (^changeColorBlock)(UIColor *);

@end
