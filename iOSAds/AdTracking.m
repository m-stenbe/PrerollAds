//
//  AdTracking.m
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdTracking.h"
#import "Ticket.h"
#import "TicketList.h"
#import "Creatives.h"
#import "Linear.h"
#import "Tracking.h"
#import "VideoClicks.h"

@implementation AdTracking

- (id) init {
    if (self = [super init]) {
        clickThrough = @"";
        clickTracking = @"";
        trackingData = @"";
        adUrl = @"";
        error = @"";
        [self getTrackingInfo];
    }
    return self;
}

#pragma Tracking Data


//send data when ad is clicked
- (void)adClicked {
    NSInteger code = [self sendTrackingData:clickTracking];
    if (code == 200) {
        NSLog(@"trackingdata sent OK!");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:clickThrough]];
    }
    else {
        NSInteger errorCode;
        [self sendTrackingData:error];
        NSLog(@"Error sending tracking data : %ld", (long)errorCode);
    }
}

//send data when ad has finished playing
- (void)adPlayed {
    NSInteger code = [self sendTrackingData:trackingData];
    if (code == 200) {
        NSLog(@"trackingdata sent OK!");
    }
    else {
        NSInteger err = [self sendTrackingData:error];
        NSLog(@"Error sending tracking data : %ld", (long)err);
    }
}

//get tracking & clickthrough info from the parsed XML file

- (void)getTrackingInfo {
    NSMutableArray* trackingArr = [NSMutableArray new];
    for (int i = 0; i < [[TicketList instance] getTicketCount]; i++) {
        ticket = [[TicketList instance] getTicket:i];
        for (int j = 0; j < [ticket getCreativeCount]; j++) {
            Creatives* c = [ticket getCreative:j];
            for (int k = 0; k < [c getLinearCount]; k++) {
                Linear* linear = [c getLinear:k];
                for (int l = 0; l < [linear getVideoClicksCount]; l++) {
                    VideoClicks* clicks = [linear getVideoClick:l];
                    clickThrough = [clicks clickThrough];
                    clickTracking = [clicks clickTracking];
                }
                for (int n = 0; n < [linear getTrackingCount]; n++) {
                    trackingArr = (NSMutableArray*)[linear getTrackingEvents];
                }
            }
        }
    }
    for (Tracking* t in trackingArr) {
        if ([t.event isEqualToString:@"complete"]) {
            trackingData = t.cdata;
        }
    }
}

//send the tracking data back to server

- (NSInteger) sendTrackingData:(NSString*) cdata {
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:cdata]];
    [request setHTTPMethod:@"POST"];
    NSURLResponse* response;
    NSError* err;
    NSData* rData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSLog(@"%@", rData);
    NSHTTPURLResponse* resp = (NSHTTPURLResponse*) response;
    NSInteger code = [resp statusCode];
    return code;
}

@end
