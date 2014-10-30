//
//  MediaFile.m
//  iOS_Ads_Thingy
//
//  Created by Mikael on 27/10/14.
//  Copyright (c) 2014 Mikael. All rights reserved.
//

#import "MediaFile.h"
#import "TicketList.h"
#import "Ticket.h"
#import "Creatives.h"
#import "Linear.h"

@implementation MediaFile

- (id) init {
    if (self= [super init]) {
        self.delivery = @"";
        self.type = @"";
        self.bitrate = @"";
        self.width = @"";
        self.height = @"";
        self.scalable = NO;
        self.cdata = @"";
    }
    return self;
    
}

- (NSArray*) getMediaFiles {
    NSArray* arr = [NSArray new];
    for (int i = 0; i < [[TicketList instance] getTicketCount]; i++) {
        Ticket* t = [[TicketList instance] getTicket:i];
        for (int j = 0; j < [t getCreativeCount]; j++) {
            Creatives* c = [t getCreative:j];
            for (int k = 0; k < [c getLinearCount]; k++) {
                Linear* li = [c getLinear:k];
                arr = [NSArray arrayWithArray:[li getMediaFiles]];
            }
        }
    }
    return arr;
}

@end
