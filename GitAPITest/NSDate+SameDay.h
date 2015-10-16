//
//  NSDate+SameDay.h
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/17.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SameDay)
- (BOOL)isSameDayAsDate:(NSDate*)otherDate;
@end
