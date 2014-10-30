//
//  Tracking.m
//  iOS_Ads_Thingy
//
//  Created by Mikael on 27/10/14.
//  Copyright (c) 2014 Mikael. All rights reserved.
//

#import "Tracking.h"

@implementation Tracking

- (id) init {
    if (self = [super init]) {
        self.event = @"";
        self.cdata = @"";
    }
    return self;
}

@end
