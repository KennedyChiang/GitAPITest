//
//  ViewController.m
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/16.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import "ViewController.h"
#import "RepositoriesListTableViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.organizationTextField.placeholder = @"afnetworking";
    self.organizationTextField.keyboardType = UIKeyboardTypeASCIICapable;
    
    self.warningLabel.textColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)SubmitAction:(id)sender {
    
    if (NO == [GeneralMethod isSafeString:self.organizationTextField.text])
    {
        self.warningLabel.text = @"Search only English and Number";
        return;
    }
    
    [GeneralMethod showLoadingOnViewController:self];
    
    [[RESTfulAPI sharedRESTfulAPI] RESTfulGitRepositoriesWithName:self.organizationTextField.text completion:^(id result, NSError *error) {
        
        [GeneralMethod hideLoadingOnViewController:self];
       
        if (nil == error)
        {
            self.warningLabel.text = @"";
            RepositoriesListTableViewController *destViewController = [[RepositoriesListTableViewController alloc] init];
            [destViewController setRepoList:result];
            [self.navigationController pushViewController:destViewController animated:YES];
        }
        else
        {
            self.warningLabel.text = [error.userInfo objectForKey:NSLocalizedDescriptionKey];
        }
    }];
}

@end
