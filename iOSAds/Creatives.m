//
//  Creatives.m
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import "Creatives.h"

@implementation Creatives

- (id) init {
    if (self = [super init]) {
        self.theId = @"";
        linears = [NSMutableArray new];
    }
    return self;
}

- (void) addLinears:(Linear*) linear {
    [linears addObject:linear];
}

- (Linear*) getLinear:(int) index {
    if ([linears count] > 0) {
        if (index <= 0 && index < [linears count]) {
            return [linears objectAtIndex:index];
        }
    }
    return nil;
}

- (int)getLinearCount {
    return (int)[linears count];
}

- (NSArray*) getLinear {
    return linears;
}


@end
