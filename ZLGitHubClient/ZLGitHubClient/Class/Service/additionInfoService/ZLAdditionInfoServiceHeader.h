//
//  ZLAdditionInfoServiceHeader.h
//  ZLGitHubClient
//
//  Created by 朱猛 on 2019/7/31.
//  Copyright © 2019 ZM. All rights reserved.
//

#ifndef ZLAdditionInfoServiceHeader_h
#define ZLAdditionInfoServiceHeader_h

#pragma mark - Enum
/**
 * github 用户附加信息类型 
 *
 **/
typedef NS_ENUM(NSUInteger, ZLUserAdditionInfoType) {
    ZLUserAdditionInfoTypeRepositories,
    ZLUserAdditionInfoTypeGists,
    ZLUserAdditionInfoTypeFollowers,
    ZLUserAdditionInfoTypeFollowing,
    ZLUserAdditionInfoTypeStars,
};


#pragma mark - NotificationName

static const NSNotificationName ZLGetReposResult_Notification = @"ZLGetReposResult_Notification";
static const NSNotificationName ZLGetFollowersResult_Notification = @"ZLGetFollowersResult_Notification";
static const NSNotificationName ZLGetFollowingResult_Notification = @"ZLGetFollowingResult_Notification";
static const NSNotificationName ZLGetGistsResult_Notification = @"ZLGetGistsResult_Notification";


#endif /* ZLAdditionInfoServiceHeader_h */
