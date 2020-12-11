//
//  ZLDeviceInfo.h
//  ZLGitHubClient
//
//  Created by ZM on 2019/12/19.
//  Copyright © 2019 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLDeviceInfo : NSObject

+ (NSString *) getDeviceSystemVersion;

+ (NSString *) getDeviceModel;

+ (NSString *) getAppShortVersion;

+ (NSString *) getAppVersion;

+ (NSString *) getAppName;

+ (BOOL) isIpad;

+ (BOOL) isIPhone;

+ (UIDeviceOrientation) getDeviceOrientation;

@end

NS_ASSUME_NONNULL_END
