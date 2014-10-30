//
//  InitTicket.m
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import "InitTicket.h"
#import "XMLParser.h"

@implementation InitTicket

- (id) init {
    if (self = [super init]) {
        [self initXmlFile];
    }
    return self;
}

- (void)initXmlFile {
    XMLParser* parser = [[XMLParser alloc] initXmlParser];
    [parser doParse];
}

@end
