//
//  ChangeColorViewController.h
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "ChangeColorDelegate.h"
#import <UIKit/UIKit.h>

@interface ChangeColorDelegationViewController : UITableViewController

@property (nonatomic, weak) id<ChangeColorDelegate> delegate;

@end
