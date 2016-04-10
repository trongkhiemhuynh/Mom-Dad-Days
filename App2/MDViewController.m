//
//  ViewController.m
//  App2
//
//  Created by Khiem T. Huynh on 4/10/16.
//  Copyright © 2016 Khiem Huynh. All rights reserved.
//

#import "MDViewController.h"

@interface MDViewController () {
    NSMutableArray *pickerData;
    NSString *dateString;
    NSString *year_destination;
    
    NSInteger day;
    NSInteger month;
    NSInteger year;
    NSInteger weekday;
    int tmp_day;
}

@end

@implementation MDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    // set title navigation
    self.title = @"NGÀY CỦA MẸ & BA";
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:25],
                                                                    NSForegroundColorAttributeName: [UIColor blackColor]
                                                                    };
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
    // set color navigation bar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    // set data picker view
    pickerData = [self arrayWithYear:1990 andEndDate:2090];
    
    
    NSURL *musicFile = [[NSBundle mainBundle] URLForResource:@"DaoLamCon" withExtension:@"mp3"];
    
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    
    self.backgroundMusic.numberOfLoops = -1;
    [self.backgroundMusic play];
    
    // Hom nay ngay 9 thang 4.
    
    // if thu 7 +1
    // chu nhat +0
    //    thu 2 + +6
    //    thu 3 +5
    //    thu 4 +4
    //    thu 5 +3
    //    thu 6 +2
    
    // quy ve ngay chu nhat gan do
    
    //    buoc 2: -7 ngay neu so nam tinh < hien tai
    //    // +7 neu lon hon
    //
    //    thang 1 31
    //    thang 2 ??? 28 hoac 29
    //    thang 3,4,5,6,7,8,9,10,11,12
    
    //    NSDate *date = [NSDate date];
    //    NSCalendar *gregorian = [NSCalendar currentCalendar];
    //    NSDateComponents *dateComponents = [gregorian components:(NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit) fromDate:date];
    //
    //    NSInteger day = [dateComponents day];
    //    NSInteger month = [dateComponents month];
    //    NSInteger year = [dateComponents year];
    //    NSInteger weekday = [dateComponents weekday];
    
    //    if (year > 1990) {
    //
    //    } else {
    //
    //    }
    
    //    [self.lblResult setText:[NSString stringWithFormat:@"ngay %ld thang %ld nam %ld, %ld ",day,month,year,weekday]];
    
    ////    NSDate *today = [NSDate date];
    //    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    ////    [dateFormat setDateFormat:@"EEE d-MMM-yy HH:mma"];
    //    [dateFormat setDateFormat:@"EEE"];
    //    dateString = [dateFormat stringFromDate:date];
    //
    //    int tmp_day = (int) day;
    //
    //    if ([dateString isEqualToString:@"Mon"]) {
    //        tmp_day += 6;
    //    } else if ([dateString isEqualToString:@"Tue"]) {
    //        tmp_day += 5;
    //    } else if ([dateString isEqualToString:@"Wed"]) {
    //        tmp_day += 4;
    //    } else if ([dateString isEqualToString:@"Thu"]) {
    //        tmp_day += 3;
    //    } else if ([dateString isEqualToString:@"Fri"]) {
    //        tmp_day += 2;
    //    } else if ([dateString isEqualToString:@"Sat"]) {
    //        tmp_day += 1;
    //    }
    //
    //    NSLog(@"Lay ngay chu nhat gan nhat %d", tmp_day);
    //
    //
    //
    //    do {
    //        tmp_day = tmp_day - 7;
    //        if (tmp_day <= 0) {
    //            month = month -1;
    //            if (month <= 0) {
    //                month = 12;
    //                year = year -1;
    //            }
    //
    //            tmp_day = [self getDayofMonth:(int)month andYear:(int) year] + tmp_day;
    //
    ////            if (month == 1) {
    ////                break;
    ////            }
    //
    //
    //            if (month == 5 && year == 2000) {
    //                break;
    //            }
    //
    //
    //        }
    //    } while (1);
    //
    //    NSLog(@"Lay ngay chu nhat gan nhat dfdffdfd %d", tmp_day);
    
}

- (BOOL)checkDayMonthTwo: (int) mYear {
    if (((mYear%4 == 0) && (mYear%100 != 0) ) || mYear%400 ==0) {
        return true;
    } else {
        return false;
    }
}

- (int)getDayofMonth: (int) mMonth andYear:(int) mYear {
    switch ((int)mMonth) {
        case 1:
            return 31;
        case 2:
            if ([self checkDayMonthTwo:mYear]) {
                return 29;
            }
            return 28;
        case 3:
            return 31;
        case 4:
            return 30;
        case 5:
            return 31;
        case 6:
            return 30;
        case 7:
            return 31;
        case 8:
            return 31;
        case 9:
            return 30;
        case 10:
            return 31;
        case 11:
            return 30;
        case 12:
            return 31;
        default:
            return 31;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSMutableArray *) arrayWithYear: (int)startDate andEndDate:(int)endDate {
    
    NSMutableArray *yearArray = [NSMutableArray array];
    for (int i = startDate; i <= endDate; i++) {
        [yearArray addObject:[NSString stringWithFormat:@"%i",i]];
    }
    return yearArray;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //    [self.lblResult setText:[NSString stringWithFormat:@"Chủ Nhật Năm %@",pickerData[row]]];
    
    year_destination = pickerData[row];
    
    int year_des = year_destination.intValue;
    
    [self initData];
    
    BOOL flag_entry = false;
    
    if (year > year_des ) {
        do {
            tmp_day = tmp_day - 7;
            if (tmp_day <= 0) {
                month = month -1;
                if (month <= 0) {
                    month = 12;
                    year = year -1;
                }
                
                tmp_day = [self getDayofMonth:(int)month andYear:(int) year] + tmp_day;
            }
            
            if (month == 5 && year == year_des) {
                if ((tmp_day - 14) <= 0) {
                    [self.lblResultMom setText:[NSString stringWithFormat:@"Chủ nhật, ngày %d tháng 5 năm %d", tmp_day, year_des ]];
                    break;
                }
            }
            
            if (month == 6 && year == year_des && !flag_entry) {
                if ((tmp_day - 21) <= 0) {
                    flag_entry = true;
                    [self.lblResultDad setText:[NSString stringWithFormat:@"Chủ nhật, ngày %d tháng 6 năm %d", tmp_day, year_des ]];
                    //                    break;
                }
            }
            
        } while (1);
        
        
    } else {
        do {
            tmp_day = tmp_day + 7;
            if (tmp_day > [self getDayofMonth:(int)month andYear:(int) year]) {
                month = month +1;
                if (month > 12) {
                    month = 1;
                    year = year +1;
                }
                
                tmp_day = tmp_day - [self getDayofMonth:(int)(month-1) andYear:(int) year];
                
                if (month == 5 && year == year_des && !flag_entry) {
                    flag_entry = true;
                    [self.lblResultMom setText:[NSString stringWithFormat:@"Chủ nhật, ngày %d tháng 5 năm %d", tmp_day + 7, year_des ]];
                }
                
                if (month == 6 && year == year_des) {
                    [self.lblResultDad setText:[NSString stringWithFormat:@"Chủ nhật, ngày %d tháng 6 năm %d", tmp_day + 14, year_des ]];
                    break;
                }
            }
        } while (1);
        
        
    }
}

//- (UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
//    UILabel *tView = (UILabel *)view;
//
//    if (!tView) {
//        tView = [[UILabel alloc] init];
//        [tView setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
//        tView.numberOfLines = 4;
//    }
//
//    tView.text = [pickerData objectAtIndex:row];
//    return tView;
//}

- (void)initData {
    NSDate *date = [NSDate date];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [gregorian components:(NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit) fromDate:date];
    
    //    NSDateComponents *dateComponents = [gregorian components:(NSCalendarUnitDay|NSCalendarUnitDay|NSCalendarUnitYear) fromDate:date];
    
    day = [dateComponents day];
    month = [dateComponents month];
    year = [dateComponents year];
    weekday = [dateComponents weekday];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //    [dateFormat setDateFormat:@"EEE d-MMM-yy HH:mma"];
    [dateFormat setDateFormat:@"EEE"];
    dateString = [dateFormat stringFromDate:date];
    
    tmp_day = (int) day;
    
    if ([dateString isEqualToString:@"Mon"]) {
        tmp_day += 6;
    } else if ([dateString isEqualToString:@"Tue"]) {
        tmp_day += 5;
    } else if ([dateString isEqualToString:@"Wed"]) {
        tmp_day += 4;
    } else if ([dateString isEqualToString:@"Thu"]) {
        tmp_day += 3;
    } else if ([dateString isEqualToString:@"Fri"]) {
        tmp_day += 2;
    } else if ([dateString isEqualToString:@"Sat"]) {
        tmp_day += 1;
    }
}

@end

