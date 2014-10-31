//
//  Linear.m
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import "Linear.h"

@implementation Linear

- (id) init {
    if (self = [super init]) {
        mediafiles = [NSMutableArray new];
        trackings = [NSMutableArray new];
        videoclicks = [NSMutableArray new];
        self.duration = @"";
    }
    return self;
}

- (void) addTrackingEvents:(Tracking*) event {
    [trackings addObject:event];
}
- (Tracking*) getTrackingEvent:(int) index {
    if ([trackings count] > 0) {
        if (index <= 0 && index < [trackings count]) {
            return [trackings objectAtIndex:index];
        }
    }
    return nil;
}
- (int) getTrackingCount {
    return [trackings count];
}
- (NSArray*) getTrackingEvents {
    return trackings;
}

- (void) addMediaFiles:(MediaFile*) mediafile {
    [mediafiles addObject:mediafile];
}

- (MediaFile*) getMediaFile:(int) index {
    if ([mediafiles count] > 0) {
        if (index <= 0 && index < [mediafiles count]) {
            return [mediafiles objectAtIndex:index];
        }
    }
    return nil;
}

- (int) getMediaFileCount {
    return [mediafiles count];
}

- (NSArray*) getMediaFiles {
    return mediafiles;
}

- (void) addVideClicks:(VideoClicks*) videoClick {
    [videoclicks addObject: videoClick];
}
- (VideoClicks*) getVideoClick:(int) index {
    if ([videoclicks count] > 0) {
        if (index <= 0 && index < [videoclicks count]) {
            return [videoclicks objectAtIndex:index];
        }
    }
    return nil;
}
- (int) getVideoClicksCount {
    return [videoclicks count];
}
- (NSArray*) getVideoClicks {
    return videoclicks;
}

@end
