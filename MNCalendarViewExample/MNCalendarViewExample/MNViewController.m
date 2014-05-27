//
//  MNViewController.m
//  MNCalendarViewExample
//
//  Created by Min Kim on 7/26/13.
//  Copyright (c) 2013 min. All rights reserved.
//

#import <MNCalendarView/NSDate+MNAdditions.h>
#import "MNViewController.h"

@interface MNViewController () <MNCalendarViewDelegate>

@property(nonatomic,strong) NSCalendar     *calendar;
@property(nonatomic,strong) MNCalendarView *calendarView;
@property(nonatomic,strong) NSDate         *currentDate;

@property(strong) NSDate *startForbiddenDate;
@property(strong) NSDate *endForbiddenDate;

@end

@implementation MNViewController

- (instancetype)initWithCalendar:(NSCalendar *)calendar title:(NSString *)title {
  if (self = [super init]) {
    self.calendar = calendar;
    self.title = title;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = UIColor.whiteColor;
  
  self.currentDate = [NSDate date];

  self.calendarView = [[MNCalendarView alloc] initWithFrame:self.view.bounds calendar:self.calendar];
  self.calendarView.selectedDate = [NSDate date];
  self.calendarView.delegate = self;
  self.calendarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
  self.calendarView.backgroundColor = UIColor.whiteColor;
  
  self.startForbiddenDate = [self.currentDate mn_dateByAdding:1 unit:NSCalendarUnitWeekOfYear calendar:self.calendar];
  self.endForbiddenDate = [self.currentDate mn_dateByAdding:2 unit:NSCalendarUnitWeekOfYear calendar:self.calendar];
  
  [self.view addSubview:self.calendarView];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [self.calendarView.collectionView.collectionViewLayout invalidateLayout];
  [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  [self.calendarView reloadData];
}

#pragma mark - MNCalendarViewDelegate

- (void)calendarView:(MNCalendarView *)calendarView didSelectDate:(NSDate *)date {
  NSLog(@"date selected: %@", date);
}

- (BOOL)calendarView:(MNCalendarView *)calendarView shouldSelectDate:(NSDate *)date {
  NSTimeInterval timeInterval = [date timeIntervalSinceDate:self.currentDate];

  return ([date compare:self.startForbiddenDate] != NSOrderedDescending || [date compare:self.endForbiddenDate] != NSOrderedAscending);
}

@end
