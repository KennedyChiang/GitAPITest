//
//  GeneralMethod.h
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/16.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GeneralMethod : NSObject

+ (void)showLoadingOnViewController:(UIViewController *)viewController;
+ (void)hideLoadingOnViewController:(UIViewController *)viewController;
+ (BOOL)isSafeString:(NSString *)string;
@end
