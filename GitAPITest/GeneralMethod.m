//
//  GeneralMethod.m
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/16.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import "GeneralMethod.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation GeneralMethod

+ (void)showLoadingOnViewController:(UIViewController *)viewController
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading";
}

+ (void)hideLoadingOnViewController:(UIViewController *)viewController
{
    [MBProgressHUD hideHUDForView:viewController.view animated:YES];
}

+ (BOOL)isSafeString:(NSString *)string
{
    NSString *emailRegex = @"^[A-Za-z0-9]+$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:string];
}

@end
