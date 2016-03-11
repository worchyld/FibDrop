//
//  FibTableViewController.m
//  FibDrop
//
//  Created by Amarjit on 11/03/2016.
//  Copyright © 2016 Amarjit. All rights reserved.
//

#import "FibTableViewController.h"
#import "FibCustomTableViewCell.h"
#import "Fibonacci.h"
#import <SVProgressHUD/SVProgressHUD.h>

static const CGFloat kTableRowHeight = 44.0f;
static const CGFloat kInitialAnimationDelta = 0.5f;
static const CGFloat kFadeInAnimationDelta = 1.5f;

@interface FibTableViewController ()
@property (nonatomic, strong) NSArray *objects;
@end

@implementation FibTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = NSLocalizedString(@"Fibonacci", @"Page Title");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerClass:[FibCustomTableViewCell class] forCellReuseIdentifier:FibSegmentCellReuseID];

    if (!self.objects)
    {
        [self reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.objects = nil;
}


- (void) reloadData
{
    [SVProgressHUD show];
    [Fibonacci createFibonacciSequenceWithCompletion:^(NSArray *sequence, NSError *error) {
        [SVProgressHUD dismiss];
        if (sequence) {
            self.objects = [sequence copy];
            [self.tableView reloadData];
        }
    }];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FibCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FibSegmentCellReuseID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (void) configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *item = [self.objects objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", [item longValue]];
    cell.alpha = 0;

    // Animate imageview setup
    [UIView animateWithDuration:kInitialAnimationDelta animations:^{

        cell.alpha = 0;
        
    } completion:^(BOOL finished) {
        if (finished == YES)
        {
            // Fade in animation
            [UIView animateWithDuration:kFadeInAnimationDelta animations:^{
                cell.alpha = 1;
            }];
        }
    }];

}


- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTableRowHeight;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTableRowHeight;
}

@end
