//
//  Linear.h
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Tracking;
@class MediaFile;
@class VideoClicks;

@interface Linear : NSObject {
    NSMutableArray* trackings;
    NSMutableArray* mediafiles;
    NSMutableArray* videoclicks;
}

@property (assign) float duration;

- (void) addTrackingEvents:(Tracking*) event;
- (Tracking*) getTrackingEvent:(int) index;
- (int) getTrackingCount;
- (NSArray*) getTrackingEvents;

- (void) addMediaFiles:(MediaFile*) mediafile;
- (MediaFile*) getMediaFile:(int) index;
- (int) getMediaFileCount;
- (NSArray*) getMediaFiles;

- (void) addVideClicks:(VideoClicks*) videoClick;
- (VideoClicks*) getVideoClick:(int) index;
- (int) getVideoClicksCount;
- (NSArray*) getVideoClicks;

@end
