//
//  EntryLogsTableViewController.m
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/16/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "EntryLogsTableViewController.h"
#import "Entry.h"
#import "Habit.h"
#import "MainPageVC.h"
#import "EntryLogsTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "SharedManager.h"
#import "NSDate+TimeAgo.h"




@interface EntryLogsTableViewController ()

@property (nonatomic) NSArray *data;

@property (nonatomic) NSDate *entryCreationDate;

@property (nonatomic) NSArray *urlStringsArray;

@property (nonatomic) NSMutableArray *temps;

@property (nonatomic)  NSInteger index;
@property (strong, nonatomic) IBOutlet UITableView *entryTableView;


@end


@implementation EntryLogsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"My Entries";
    
    UINib *nib = [UINib nibWithNibName:@"EntryLogsTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"entryLogCellID"];
    self.urlStringsArray = [self urlStringsArray];
    
    [self addColorEntryLog];

}



#pragma mark- Add Color
-(void)addColorEntryLog {
    self.entryTableView.backgroundColor = [SharedManager sharedModel].tropicalDream;
}



-(NSString *)stringFromTimeInterval:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"EEEE"];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    return dateName;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.habit.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EntryLogsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryLogCellID" forIndexPath:indexPath];
    
    Entry *entry = self.habit.entries[indexPath.row];
    self.entryCreationDate = entry.createdAt;
    NSLog(@"Output for date is: %@",[entry.createdAt timeAgo]);
    NSString *dateString = [entry.createdAt timeAgo];
    
    cell.tempInfoLabel.text = entry.temperature;
    cell.locationLabel.text = entry.location;
    
    cell.entryDateLabel.text = dateString;
    
    cell.backgroundColor = [SharedManager sharedModel].blueSky;
    cell.tempInfoLabel.textColor = [SharedManager sharedModel].brickRed;
    cell.tempInfoLabel.font = [UIFont fontWithName:@"Bariol" size:22.0];
    
    cell.locationLabel.textColor = [SharedManager sharedModel].brickRed;
    cell.locationLabel.font = [UIFont fontWithName:@"Bariol" size:22.0];
    
    cell.entryDateLabel.textColor = [SharedManager sharedModel].brownForest;
    cell.entryDateLabel.font = [UIFont fontWithName:@"Bariol" size:22.0];
  
    return cell;
}

-(NSString *)dateStringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainPageVC *mainPageVC = (MainPageVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"showMainPgVC"];
    
    mainPageVC.entry = self.habit.entries[indexPath.row];
    mainPageVC.readOnly = YES;
    mainPageVC.habitName = self.habit.name;
    
    [self.navigationController pushViewController:mainPageVC animated:YES];
}

-(NSString *)formattedDateStringForAPI:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

-(NSArray<NSString *> *)arrayWithFormattedDateStrings{
    NSMutableArray *dateStrings = [[NSMutableArray alloc] init];
    for(Entry *entry in self.habit.entries){
        NSString *formattedString = [self formattedDateStringForAPI:entry.createdAt];
        [dateStrings addObject:formattedString];
    }
    return dateStrings;
}



@end
