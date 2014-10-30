//
//  TicketList.h
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Ticket;

@interface TicketList : NSObject {
    NSMutableArray* tickets;
}

+ (TicketList*) instance;

- (void) addTicket:(Ticket*) ticket;
- (NSArray*) getTickets;
- (int) getTicketCount;
- (Ticket*) getTicket:(int) index;

@end
