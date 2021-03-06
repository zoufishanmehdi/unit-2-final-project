//
//  Step.h
//  BreakingBad
//
//  Created by Mesfin Bekele Mekonnen on 10/11/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import "PFObject.h"
#import <Parse/Parse.h>

@interface Step : PFObject<PFSubclassing>

@property (nonatomic) NSString *stepDescription;
@property (nonatomic) BOOL completed;

@end
