//
//  RepoCalendarViewController.h
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/16.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"

@interface RepoCalendarViewController : UIViewController<FSCalendarDelegate,FSCalendarDataSource>

@property (strong, nonatomic) NSDictionary *repoDic;
@property (weak , nonatomic) FSCalendar *calendar;

@end
