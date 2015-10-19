//
//  MyHabitsTVC.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "MyHabitsTVC.h"
#import "Habit.h"
#import "EntryLogsTableViewController.h"
#import <Parse/Parse.h>
#import <AFNetworking/AFNetworking.h>

@interface MyHabitsTVC ()

@end

@implementation MyHabitsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"My Habits";
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.habitsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myHabitsCell" forIndexPath:indexPath];
    Habit *habit = self.habitsArray[indexPath.row];
    cell.textLabel.text = habit.name;
    
    return cell;
}


- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EntryLogsTableViewController *eltvc = (EntryLogsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"entryLogsID"];
    
    eltvc.habit = self.habitsArray[indexPath.row];
    [self.navigationController pushViewController:eltvc animated:YES];
    
}
@end
