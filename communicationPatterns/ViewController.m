//
//  ViewController.m
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "ChangeColorBlockViewController.h"
#import "ChangeColorDelegationViewController.h"
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Communication Patterns";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CommunicationPatternCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommunicationPatternCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Delegation";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Blocks";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ChangeColorDelegationViewController *changeColorDelegationVC = [[ChangeColorDelegationViewController alloc] init];
        changeColorDelegationVC.delegate = self;
        [self.navigationController pushViewController:changeColorDelegationVC animated:YES];
    } else if (indexPath.row == 1) {
        ChangeColorBlockViewController *changeColorBlockVC = [[ChangeColorBlockViewController alloc] init];
        
        changeColorBlockVC.changeColorBlock = ^(UIColor *color) {
            self.tableView.backgroundColor = color;
        };
        
        [self.navigationController pushViewController:changeColorBlockVC animated:YES];
    }
}

- (void)changeColor:(UIColor *)color {
    self.tableView.backgroundColor = color;
}

@end
