//
//  RESTfulAPI.m
//  GitAPITest
//
//  Created by Chiang Ming Lun on 2015/10/16.
//  Copyright © 2015年 Chiang Ming Lun. All rights reserved.
//

#import "RESTfulAPI.h"

@implementation RESTfulAPI

+ (RESTfulAPI *)sharedRESTfulAPI
{
    static RESTfulAPI *restful = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        restful = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.github.com"]];
        [restful setSecurityPolicy:[AFSecurityPolicy defaultPolicy]];
    });
    
    return restful;
}

- (BOOL)isNetworkReachable {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

- (void)RESTfulGitRepositoriesWithName:(NSString *)name completion:(CompletionHandlerWithResult)complete
{
    if ([self isNetworkReachable])
    {
        complete(nil,[NSError errorWithDomain:@"Warning"
                                         code:-5566
                                     userInfo:@{NSLocalizedDescriptionKey:@"Network is unReachable"}]);
        return;
    }
    
    
    NSString *function = [NSString stringWithFormat:@"/users/%@/repos",name];
    
    [self GET:function parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {

        complete(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        complete(nil,error);
    }];
}

- (void)RESTfulGitRepositoriesPath:(NSString *)path completion:(CompletionHandlerWithResult)complete
{
    if ([self isNetworkReachable])
    {
        complete(nil,[NSError errorWithDomain:@"Warning"
                                         code:-5566
                                     userInfo:@{NSLocalizedDescriptionKey:@"Network is unReachable"}]);
        return;
    }
    
    [self GET:path parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        complete(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        
        complete(nil,error);
    }];
}

@end
