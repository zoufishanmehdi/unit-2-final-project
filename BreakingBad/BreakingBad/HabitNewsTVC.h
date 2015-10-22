//
//  HabitNewsTVC.h
//  BreakingBad
//
//  Created by Zoufishan Mehdi on 10/19/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HabitInfoData.h"

@interface HabitNewsTVC : UITableViewController


@property (nonatomic) HabitInfoData *data;
//@property (nonatomic) NSString *habitDataPicked;
@property (nonatomic) NSMutableArray *searchResults;
@property (nonatomic) Habit *habit;

-(void)addColorHabitNews; 

@end
