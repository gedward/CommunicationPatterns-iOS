//
//  ViewController.m
//  communicationPatterns
//
//  Created by Gerard Gonzalez on 8/2/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "ChangeColorBlockViewController.h"
#import "ChangeColorDelegationViewController.h"
#import "ChangeColorKVOTableViewController.h"
#import "ChangeColorNotificationViewController.h"
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Communication Patterns";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CommunicationPatternCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:@"ChangeColorNotification" object:nil];
}

- (void)didReceiveNotification:(NSNotification *)note {
    self.tableView.backgroundColor = note.userInfo[@"color"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommunicationPatternCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Delegation";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Blocks";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"Notification";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"Key-Value Observation";
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
    } else if (indexPath.row == 2) {
        ChangeColorNotificationViewController *changeColorNotificationVC = [[ChangeColorNotificationViewController alloc] init];
        [self.navigationController pushViewController:changeColorNotificationVC animated:YES];
    } else if (indexPath.row == 3) {
        ChangeColorKVOTableViewController *changeColorKVOVC = [[ChangeColorKVOTableViewController alloc] init];

        [changeColorKVOVC addObserver:self forKeyPath:@"selectedColor" options:0 context:nil];
        
        [self.navigationController pushViewController:changeColorKVOVC animated:YES];
    }
}

- (void)changeColor:(UIColor *)color {
    self.tableView.backgroundColor = color;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"selectedColor"]) {
        self.tableView.backgroundColor = [object valueForKeyPath:keyPath];
        [object removeObserver:self forKeyPath:@"selectedColor"];
    }
}

@end
