//
//  TicketList.m
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import "TicketList.h"

@implementation TicketList

static TicketList* instance = nil;

+(TicketList*) instance {
    @synchronized(self) {
        if (instance == nil) {
            instance = [TicketList new];
        }
    }
    return instance;
}

- (id) init {
    if (self = [super init]) {
        tickets = [NSMutableArray new];
    }
    return self;
}

- (void) addTicket:(Ticket*) ticket {
    [tickets addObject:ticket];
}

- (NSArray*) getTickets {
    return tickets;
}
- (int) getTicketCount {
    return (int)[tickets count];
}
- (Ticket*) getTicket:(int) index {
    if ([tickets count] > 0)  {
        if (0 <= index && index < [tickets count]) {
            return [tickets objectAtIndex:index];
        }
    }
    return nil;
}

@end
