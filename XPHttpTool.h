//
//  XPHttpTool.h
//  JXW
//
//  Created by laizhijin on 15/11/16.
//  Copyright © 2015年 Simplex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XPHttpTool : NSObject
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
@end
