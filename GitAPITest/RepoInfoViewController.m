//
//  RepoInfoViewController.m
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/17.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import "RepoInfoViewController.h"

@implementation RepoInfoViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITextView *infoTextView = [[UITextView alloc]initWithFrame:self.view.frame];
    infoTextView.text = @"Commit Info:\n";
    
    [self.view addSubview:infoTextView];
    
    for (NSDictionary *dic in self.repoInfoList)
    {
        NSString *message = [NSString stringWithFormat:@"%@\n",dic];
        infoTextView.text = [infoTextView.text stringByAppendingString:message];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
