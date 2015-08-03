//
//  ChangeColorBlockViewController.m
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "ChangeColorBlockViewController.h"

@interface ChangeColorBlockViewController ()

@end

@implementation ChangeColorBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Blocks";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ColorCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Blue";
    } else {
        cell.textLabel.text = @"Red";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        self.changeColorBlock([UIColor blueColor]);
    } else {
        self.changeColorBlock([UIColor redColor]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
