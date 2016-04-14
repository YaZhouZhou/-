//
//  XPHttpTool.m
//  JXW
//
//  Created by laizhijin on 15/11/16.
//  Copyright © 2015年 Simplex. All rights reserved.
//

#import "XPHttpTool.h"
#import "AFNetworking.h"

@implementation XPHttpTool
/**
 *  get网络请求
 *
 *  @param url     请求透
 *  @param params  请求体
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
/**
 *  post网络请求
 *
 *  @param url     请求透
 *  @param params  请求体
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    params=[XPCountTool addSignAndAccessTokenWithDicationary:params];//添加sign和accessToken
//    ZLog(@"请求管理者%@",[XPCountTool getUrlByDictionary:params]);
    // 1.创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
//    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
//    [mgr.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [mgr.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    
    
    // 2.发送请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//           [Dialog simpleToast:@"网络连接失败"];
        
        if (failure) {
            failure(error);
        }
    }];
}
@end
