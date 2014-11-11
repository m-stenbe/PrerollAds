//
//  PrerollAdsTests.m
//  PrerollAdsTests
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "XMLParser.h"
#import "AdTracking.h"
#import "MediaFile.h"
#import "AdsVideoPlayer.h"

#define CLICKTRACKINGURL @"http://carrers.videoplaza.tv/proxy/tracker/v2?aid=5896fbf5-4b6e-4ea0-a45b-58f232bb0ddc&cf=short_form&dcid=b43bcb1c-8384-421b-906f-37b181ccc5a8&e=20&pid=f9b7e055-27a6-47ba-8f0c-346491c7d835&t=recruitment1&tid=b34fbb99-69c8-11e4-a8dd-002590e342b5&tt=p"
#define TRACKINGEVENTURL @"http://carrers.videoplaza.tv/proxy/tracker/v2?aid=5896fbf5-4b6e-4ea0-a45b-58f232bb0ddc&cf=short_form&dcid=b43bcb1c-8384-421b-906f-37b181ccc5a8&e=18&pid=f9b7e055-27a6-47ba-8f0c-346491c7d835&t=recruitment1&tid=b34fbb99-69c8-11e4-a8dd-002590e342b5&tt=p"
#define ERRORURL @"http://carrers.videoplaza.tv/proxy/tracker/v2?aid=0&cf=short_form&dcid=b43bcb1c-8384-421b-906f-37b181ccc5a8&e=0&pid=f9b7e055-27a6-47ba-8f0c-346491c7d835&t=recruitment1&tid=b34fbb99-69c8-11e4-a8dd-002590e342b5&tt=p&ua=%5Bua%5D&uc=%5Buc%5D"
#define MADEUPURL @"http://carrers.videoplaza.tv/proxy1/tracker/v3?aid=5896fbf5-4b6e-4ea0-a45b-58f232bb0ddc&cf=short_form&dcid=b43bcb1c-8384-421b-906f-37b181ccc5a8&e=18&pid=f9b7e055-27a6-47ba-8f0c-346491c7d835&t=recruitment1&tid=b34fbb99-69c8-11e4-a8dd-002590e342b5&ttt=q"

//Access private method in AdsVideoPlayer.m.h

@interface AdsVideoPlayer (Test)

- (UIView*) setupClickThroughView;

@end

//Access private method in AdTracking.m

@interface AdTracking (Test)

- (NSInteger) sendTrackingData:(NSString*) cdata;

@end

@interface PrerollAdsTests : XCTestCase {
    XMLParser* parser;
    AdTracking* tracking;
    MediaFile* mediafile;
    AdsVideoPlayer* ads;
}

@end

@implementation PrerollAdsTests

- (void)setUp {
    [super setUp];
    ads = [AdsVideoPlayer new];
    parser = [[XMLParser alloc] initXmlParser];
    [parser doParse];
    mediafile = [MediaFile new];
    tracking = [AdTracking new];
}

- (void)tearDown {
    parser = nil;
    tracking = nil;
    mediafile = nil;
    ads = nil;
    [super tearDown];
}

#pragma AdTracking

- (void)testThatTheTrackingIsSentOkReturnCodeIs200 {
    NSInteger returnCode = [tracking sendTrackingData:TRACKINGEVENTURL];
    XCTAssertEqual(returnCode, 200);
}

- (void)testThatTrackingIsNotSentOKReturnCodeIsNot200 {
    NSInteger returnCode = [tracking sendTrackingData:MADEUPURL];
    XCTAssertNotEqual(returnCode, 200);
}

- (void) testAdPlayedMethod {
    [tracking adPlayed];
}

#pragma MediaFile

- (void) testThatTheMediaFileIsOfCorrectClass {
    NSMutableArray* arr = [NSMutableArray arrayWithArray:[mediafile getMediaFiles]];
    for (MediaFile* m in arr) {
        XCTAssert([m isKindOfClass:[MediaFile class]]);
    }
}

#pragma AdsVideoPlayer

- (void) testIfSetupClickThroughViewIsNotNilThusItHasBeenInitialized {
    XCTAssertNotNil([ads setupClickThroughView]);
}

@end
