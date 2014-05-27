//
//  MNCalendarView.h
//  MNCalendarView
//
//  Created by Min Kim on 7/23/13.
//  Copyright (c) 2013 min. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MNCalendarViewDelegate;

@interface MNCalendarView : UIView <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic,strong,readonly) UICollectionView *collectionView;

@property(nonatomic,assign) id<MNCalendarViewDelegate> delegate;

@property(nonatomic,strong,readonly) NSCalendar *calendar;
@property(nonatomic,strong) NSLocale   *locale;
@property(nonatomic,copy)   NSDate     *fromDate;
@property(nonatomic,copy)   NSDate     *toDate;
@property(nonatomic,copy)   NSDate     *selectedDate;

@property(nonatomic,strong) UIColor *separatorColor UI_APPEARANCE_SELECTOR; // default is the standard separator gray

@property(nonatomic,strong) Class headerViewClass;
@property(nonatomic,strong) Class weekdayCellClass;
@property(nonatomic,strong) Class dayCellClass;

- (instancetype)initWithFrame:(CGRect)frame calendar:(NSCalendar *)calendar;

- (void)reloadData;
- (void)registerUICollectionViewClasses; 

@end

@protocol MNCalendarViewDelegate <NSObject>

@optional

- (BOOL)calendarView:(MNCalendarView *)calendarView shouldSelectDate:(NSDate *)date;
- (void)calendarView:(MNCalendarView *)calendarView didSelectDate:(NSDate *)date;

- (BOOL)calendarView:(MNCalendarView *)calendarView shouldCustomCellWithDate:(NSDate *)date;
- (UIColor *)calendarView:(MNCalendarView *)calendarView customBackgroundWithDate:(NSDate *)date;
- (NSString *)calendarView:(MNCalendarView *)calendarView customBottomTextWithDate:(NSDate *)date;
- (UIColor *)calendarView:(MNCalendarView *)calendarView customTextColorWithDate:(NSDate *)date;
@end
