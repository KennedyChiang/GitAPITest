//
//  NSDate+SameDay.m
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/17.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import "NSDate+SameDay.h"

@implementation NSDate (SameDay)

- (BOOL)isSameDayAsDate:(NSDate*)otherDate
{    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:otherDate];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

@end
