//
//  LSNetworkManager.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSNetworkManager.h"
#import "LSDefinitions.h"
#import <AFNetworking/AFNetworking.h>

@interface LSNetworkManager ()
@property (nonatomic, strong) NSURL* baseURL;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation LSNetworkManager

- (instancetype)initWithBaseURL:(NSURL *)baseURL {
    self = [super init];
    if (baseURL) {
        _baseURL = baseURL;
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    }
    return self;
}

- (void)performGETRequestAt:(NSString*)path completion:(void(^)(NSDictionary *resultDic, NSError *error))completion {
    if (!self.manager) {
        if (completion) {
            completion(nil, [NSError errorWithDomain:LSErrorDomainNetwork code:LSErrorCodeNetworkServiceNotConfigured userInfo:nil]);
        }
        return;
    }
    [self.manager GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *responseError = nil;
        NSDictionary *resultDic = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            resultDic = responseObject;
        } else {
            responseError = [NSError errorWithDomain:LSErrorDomainNetwork code:LSErrorCodeNetworkWrongResponse userInfo:nil];
        }
        if (completion) {
            completion(resultDic, responseError);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil, error);
        }
    }];
    
}

@end
