//
//  Parser.m
//  iOS_Ads_Thingy
//
//  Created by Mikael on 22/10/14.
//  Copyright (c) 2014 Mikael. All rights reserved.
//

#import "XMLParser.h"
#import "Ticket.h"
#import "Tracking.h"
#import "MediaFile.h"
#import "Creatives.h"
#import "Linear.h"
#import "VideoClicks.h"
#import "Extension.h"
#import "TicketList.h"
#import "AdInfo.h"

#define TicketUrl @"http://carrers.videoplaza.tv/proxy/distributor/v2?rt=vast_2.0&st=20:1&t=recruitment1"

@implementation XMLParser

- (XMLParser*) initXmlParser {
    if (self = [super init]) {
        ticketlist = [TicketList new];
    }
    return self;
}

// A nicer solution would be to have the objects parse the XML file on their own when they are needed but one can argue aswell that it makes needless calls to the XML file url, or you can just store the XML file in the FW.

#pragma XMLParser

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    currentElementValue = nil;
    if ([elementName isEqualToString:@"VAST"]) {
        ticket = [Ticket new];
    }
    if ([elementName isEqualToString:@"Ad"]) {
        [ticket setAdId:[attributeDict objectForKey:@"id"]];
    }
    if ([elementName isEqualToString:@"Creative"]) {
        creatives = [Creatives new];
        [creatives setTheId:[attributeDict objectForKey:@"id"]];
    }
    if ([elementName isEqualToString:@"Linear"]) {
        linear = [Linear new];
    }
    if ([elementName isEqualToString:@"Tracking"]){
        tracking = [Tracking new];
        [tracking setEvent:[attributeDict objectForKey:@"event"]];
    }
    if ([elementName isEqualToString:@"MediaFile"]) {
        mediafile = [MediaFile new];
        [mediafile setDelivery:[attributeDict objectForKey:@"delivery"]];
        [mediafile setType:[attributeDict objectForKey:@"type"]];
        [mediafile setBitrate:[attributeDict objectForKey:@"bitrate"]];
        [mediafile setWidth:[attributeDict objectForKey:@"width"]];
        [mediafile setHeight:[attributeDict objectForKey:@"height"]];
        [mediafile setScalable:[[attributeDict objectForKey:@"scalable"] boolValue]];
    }
    if ([elementName isEqualToString:@"VideoClicks"]) {
        videoClicks = [VideoClicks new];
    }
    if ([elementName isEqualToString:@"Extension"]) {
        extension = [Extension new];
        [extension setType:[attributeDict objectForKey:@"type"]];
        [extension setName:[attributeDict objectForKey:@"name"]];
    }
    if ([elementName isEqualToString:@"AdInfo"]) {
        adinfo = [AdInfo new];
        [adinfo setGid:[attributeDict objectForKey:@"gid"]];
        [adinfo setCid:[attributeDict objectForKey:@"cid"]];
        [adinfo setFormat:[attributeDict objectForKey:@"format"]];
        [adinfo setVariant:[attributeDict objectForKey:@"variant"]];
        [adinfo setExclusive:[[attributeDict objectForKey:@"exclusive"] boolValue]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else {
        [currentElementValue appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"Error"]) {
        [ticket setError:currentElementValue];
        return;
    }
    if ([elementName isEqualToString:@"Impression"]) {
        [ticket setImpression:currentElementValue];
        return;
    }
    
    if ([elementName isEqualToString:@"Tracking"]) {
        [tracking setCdata:currentElementValue];
        [linear addTrackingEvents:tracking];
        tracking = nil;
        return;
    }
    if ([elementName isEqualToString:@"TrackingEvents"]) {
        return;
    }
    if ([elementName isEqualToString:@"ClickThrough"]) {
        [videoClicks setClickThrough:currentElementValue];
        return;
    }
    if ([elementName isEqualToString:@"ClickTracking"]) {
        [videoClicks setClickTracking:currentElementValue];
        return;
    }
    if ([elementName isEqualToString:@"VideoClicks"]) {
        [linear addVideClicks:videoClicks];
        videoClicks = nil;
        return;
    }
    if ([elementName isEqualToString:@"MediaFile"]) {
        [mediafile setCdata:currentElementValue];
        [linear addMediaFiles:mediafile];
        mediafile = nil;
        return;
    }
    if ([elementName isEqualToString:@"MediaFiles"]) {
        return;
    }
    if ([elementName isEqualToString:@"Linear"]) {
        return;
    }
    if ([elementName isEqualToString:@"Duration"]) {
        [linear setDuration:currentElementValue];
        return;
    }
    if ([elementName isEqualToString:@"Creative"]) {
        [creatives addLinears:linear];
        return;
    }
    if ([elementName isEqualToString:@"Creatives"]) {
        [ticket addCreatives:creatives];
        return;
    }
    if ([elementName isEqualToString:@"Extension"]) {
        return;
    }
    if ([elementName isEqualToString:@"AdInfo"]) {
        [extension addAdInfo:adinfo];
        adinfo = nil;
        return;
    }
    if ([elementName isEqualToString:@"Extensions"]) {
        [ticket addExtensions:extension];
        extension = nil;
        return;
    }
    if ([elementName isEqualToString:@"InLine"]) {
        return;
    }
    if ([elementName isEqualToString:@"Ad"]) {
        return;
    }
    if ([elementName isEqualToString:@"VAST"]) {
        [[TicketList instance] addTicket:ticket];
        return;
    }
    else {
        [ticket setValue:currentElementValue forKey:elementName];
    }
    currentElementValue = nil;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Error: %@", [parseError localizedDescription]);
}

- (void) doParse {
    NSXMLParser* parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:TicketUrl]];
    XMLParser* parse = [[XMLParser alloc] initXmlParser];
    [parser setDelegate:parse];
    BOOL success = [parser parse];
    if (success) {
    }
    else {
        NSError* error = [parser parserError];
        [self parser:parser parseErrorOccurred:error];
    }
    parser = nil;
    parse = nil;
}

@end
