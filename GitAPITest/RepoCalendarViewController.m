//
//  RepoCalendarViewController.m
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/16.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import "RepoCalendarViewController.h"
#import "RepoInfoViewController.h"

@interface RepoCalendarViewController ()
{
    NSDateFormatter *formatter;
    
    NSDictionary *commitDic;
}

@end

@implementation RepoCalendarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupCalendar];
    
    if (nil == self.repoDic)
    {
        return;
    }
    
    [self setupDateFormatter];
    
    NSString *commitString = [self.repoDic objectForKey:@"commits_url"];
    NSURL *commitURL = [NSURL URLWithString:[commitString componentsSeparatedByString:@"{"].firstObject];
    
    [GeneralMethod showLoadingOnViewController:self];
    
    [[RESTfulAPI sharedRESTfulAPI] RESTfulGitRepositoriesPath:[commitURL path] completion:^(id result, NSError *error) {
        
        [GeneralMethod hideLoadingOnViewController:self];
        
        if (nil == error)
        {
            commitDic = [[NSMutableDictionary alloc] init];
    
            for (NSDictionary *dic in result)
            {
                NSDictionary *commitInfo = [dic objectForKey:@"commit"];
                NSDictionary *commiter = [commitInfo objectForKey:@"committer"];
                NSString *commitDateString = [commiter objectForKey:@"date"];
                NSString *key = [[commitDateString componentsSeparatedByString:@"T"] firstObject];
                
                if (nil == [commitDic valueForKey:key])
                {
                    [commitDic setValue:[[NSMutableArray alloc]init] forKey:key];
                }
                
                [[commitDic valueForKey:key] addObject:commitInfo];
            }
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:@"Warning"
                                        message:[error.userInfo objectForKey:NSLocalizedDescriptionKey]
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil]show];
        }
        
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupDateFormatter
{
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
}

-(void)setCalendarBasicColor
{
    _calendar.appearance.weekdayTextColor = [UIColor redColor];
    _calendar.appearance.headerTitleColor = [UIColor redColor];
    _calendar.appearance.eventColor = [UIColor greenColor];
    _calendar.appearance.selectionColor = [UIColor blueColor];
    _calendar.appearance.todayColor = [UIColor orangeColor];
    _calendar.appearance.todaySelectionColor = [UIColor blackColor];
}

- (void)setupCalendar
{
    [self setCalendarBasicColor];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:self.view.bounds];
    calendar.dataSource = self;
    calendar.delegate = self;
    [self.view addSubview:calendar];
    self.calendar = calendar;
}

#pragma mark - FSCalendar DataSource

- (BOOL)calendar:(FSCalendar *)calendar hasEventForDate:(NSDate *)date
{
    if ([[commitDic allKeys] containsObject:[formatter stringFromDate:date]])
    {
        return YES;
    }
    return NO;
}

#pragma mark - FSCalendarDelegate
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date
{
    NSString *selectDate = [formatter stringFromDate:date];
    if ([[commitDic allKeys] containsObject:selectDate])
    {
        RepoInfoViewController *destViewController = [[RepoInfoViewController alloc] init];
        [destViewController setRepoInfoList:[commitDic objectForKey:selectDate]];
        [self.navigationController pushViewController:destViewController animated:YES];
    }
}

@end
