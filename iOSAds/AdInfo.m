//
//  AdInfo.m
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import "AdInfo.h"

@implementation AdInfo

- (id) init {
    if (self = [super init]) {
        self.gid = @"";
        self.cid = @"";
        self.format = @"";
        self.variant = @"";
        self.exclusive = NO;
    }
    return self;
}


@end
