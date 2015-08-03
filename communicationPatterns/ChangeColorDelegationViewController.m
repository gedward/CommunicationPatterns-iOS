//
//  ChangeColorViewController.m
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "ChangeColorDelegationViewController.h"

@implementation ChangeColorDelegationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        [self.delegate changeColor:[UIColor blueColor]];
    } else {
        [self.delegate changeColor:[UIColor redColor]];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
