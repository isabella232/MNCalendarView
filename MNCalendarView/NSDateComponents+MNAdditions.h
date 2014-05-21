//
//  NSDateComponents+MNAdditions.h
//  MNCalendarView
//
//  Created by Max von Webel on 21/05/14.
//  Copyright (c) 2014 min. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (MNAdditions)

+ (instancetype)mn_dateComponentsWithConstant:(NSInteger)constant unit:(NSCalendarUnit)calendarUnit;

@end
