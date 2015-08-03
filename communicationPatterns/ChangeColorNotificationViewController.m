//
//  ChangeColorNotificationViewController.m
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "ChangeColorNotificationViewController.h"


@implementation ChangeColorNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Notification";
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
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeColorNotification" object:nil userInfo:@{@"color": [UIColor blueColor]}];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeColorNotification" object:nil userInfo:@{@"color": [UIColor redColor]}];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
