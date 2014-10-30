//
//  Ticket.h
//  iOS_Ads_Thingy
//
//  Created by Mikael on 22/10/14.
//  Copyright (c) 2014 Mikael. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Creatives;
@class Extension;

@interface Ticket : NSObject {
    NSMutableArray* creatives;
    NSMutableArray* extensions;
}

@property (copy) NSString* error;
@property (copy) NSString* impression;
@property (copy) NSString* adSystem;
@property (copy) NSString* adTitle;
@property (copy) NSString* adId;

- (void) addCreatives:(Creatives*) creative;
- (Creatives*) getCreative:(int) index;
- (NSArray*) getCreatives;
- (int) getCreativeCount;

- (void) addExtensions:(Extension*) extension;
- (Extension*) getExtension:(int) index;
- (NSArray*) getExtension;
- (int) getExtensionCount;

@end
