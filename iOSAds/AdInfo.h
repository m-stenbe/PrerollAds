//
//  AdInfo.h
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdInfo : NSObject

@property (copy) NSString* gid;
@property (copy) NSString* cid;
@property (copy) NSString* format;
@property (copy) NSString* variant;
@property (assign) BOOL exclusive;

@end
