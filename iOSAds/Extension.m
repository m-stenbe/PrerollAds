//
//  Extension.m
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import "Extension.h"

@implementation Extension

- (id) init {
    if (self = [super init]) {
        self.type = @"";
        self.name = @"";
        adinfos = [NSMutableArray new];
    }
    return self;
}

- (void) addAdInfo:(AdInfo*) adinfo {
    [adinfos addObject:adinfo];
}
- (AdInfo*) getAdInfo:(int) index {
    if ([adinfos count] > 0) {
        if (index <= 0 && index < [adinfos count]) {
            return [adinfos objectAtIndex:index];
        }
    }
    return nil;
}
- (NSArray*) getAdInfos {
    return adinfos;
}
- (int) getAdInfoCount {
    return (int)[adinfos count];
}

@end
