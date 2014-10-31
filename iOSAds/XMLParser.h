//
//  Parser.h
//  iOS_Ads_Thingy
//
//  Created by Mikael on 22/10/14.
//  Copyright (c) 2014 Mikael. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Ticket;
@class Tracking;
@class MediaFile;
@class Linear;
@class VideoClicks;
@class Creatives;
@class Extension;
@class TicketList;
@class AdInfo;

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    NSMutableString* currentElementValue;
    Ticket* ticket;
    Tracking* tracking;
    MediaFile* mediafile;
    Creatives* creatives;
    Linear* linear;
    VideoClicks* videoClicks;
    Extension* extension;
    AdInfo* adinfo;
    TicketList* ticketlist;
}

- (XMLParser*) initXmlParser;
- (void) doParse;

@end
