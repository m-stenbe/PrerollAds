//
//  Ticket.m
//  iOS_Ads_Thingy
//
//  Created by Mikael on 22/10/14.
//  Copyright (c) 2014 Mikael. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

- (id) init {
    if (self = [super init]) {
        self.error = @"";
        self.impression = @"";
        self.adSystem = @"";
        self.adTitle = @"";
        self.adId = @"";
        creatives = [NSMutableArray new];
        extensions = [NSMutableArray new];
    }
    return self;
}

- (void) addCreatives:(Creatives*) creative {
    [creatives addObject:creative];
}
- (Creatives*) getCreative:(int) index {
    if ([creatives count] > 0) {
        if (0 <= index && index < [creatives count]) {
            return [creatives objectAtIndex:index];
        }
    }
    return nil;
}
- (NSArray*) getCreatives {
    return creatives;
}

- (int) getCreativeCount {
    return (int)[creatives count];
}

- (void) addExtensions:(Extension*) extension {
    [extensions addObject:extension];
}
- (Extension*) getExtension:(int) index {
    if ([extensions count] > 0) {
        if (index <= 0 && index < [extensions count]) {
            return [extensions objectAtIndex:index];
        }
    }
    return nil;
}
- (NSArray*) getExtension {
    return extensions;
}

- (int) getExtensionCount {
    return (int)[extensions count];
}

@end

