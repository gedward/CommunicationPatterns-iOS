//
//  ViewController.m
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "ChangeColorDelegationViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Communication Patterns";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CommunicationPatternCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommunicationPatternCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Delegation";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ChangeColorDelegationViewController *changeColorVC = [[ChangeColorDelegationViewController alloc] init];
        changeColorVC.delegate = self;
        [self.navigationController pushViewController:changeColorVC animated:YES];
    }
}

- (void)changeColor:(UIColor *)color {
    self.tableView.backgroundColor = color;
}

@end
