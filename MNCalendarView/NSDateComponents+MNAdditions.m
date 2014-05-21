//
//  NSDateComponents+MNAdditions.m
//  MNCalendarView
//
//  Created by Max von Webel on 21/05/14.
//  Copyright (c) 2014 min. All rights reserved.
//

#import "NSDateComponents+MNAdditions.h"

@implementation NSDateComponents (MNAdditions)

+ (instancetype)mn_dateComponentsWithConstant:(NSInteger)constant unit:(NSCalendarUnit)calendarUnit
{
  NSDateComponents *dateComponents = [[self alloc] init];
  
  switch (calendarUnit) {
    case NSCalendarUnitEra:
      dateComponents.era = constant;
      break;
    case NSCalendarUnitYear:
      dateComponents.year = constant;
      break;
    case NSCalendarUnitMonth:
      dateComponents.month = constant;
      break;
    case NSCalendarUnitDay:
      dateComponents.day = constant;
      break;
    case NSCalendarUnitHour:
      dateComponents.hour = constant;
      break;
    case NSCalendarUnitMinute:
      dateComponents.minute = constant;
      break;
    case NSCalendarUnitSecond:
      dateComponents.second = constant;
      break;
    case NSCalendarUnitWeekday:
      dateComponents.weekday = constant;
      break;
    case NSCalendarUnitQuarter:
      dateComponents.quarter = constant;
      break;
    case NSCalendarUnitWeekOfYear:
      dateComponents.weekOfYear = constant;
      break;
    case NSCalendarUnitWeekOfMonth:
      dateComponents.weekOfMonth = constant;
      break;
    default:
      NSAssert(NO, @"unknown calendar unit");
  }

  return dateComponents;
}

@end
