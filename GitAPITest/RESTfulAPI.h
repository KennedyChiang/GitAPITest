//
//  RESTfulAPI.h
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/16.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^CompletionHandlerWithResult)(id result, NSError *error);

@interface RESTfulAPI : AFHTTPSessionManager

+ (RESTfulAPI *)sharedRESTfulAPI;
- (void)RESTfulGitRepositoriesWithName:(NSString *)name completion:(CompletionHandlerWithResult)complete;
- (void)RESTfulGitRepositoriesPath:(NSString *)path completion:(CompletionHandlerWithResult)complete;
@end
