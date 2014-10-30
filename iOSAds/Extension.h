//
//  Extension.h
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AdInfo;

@interface Extension : NSObject {
    NSMutableArray* adinfos;
}

@property (copy) NSString* type;
@property (copy) NSString* name;

- (void) addAdInfo:(AdInfo*) adinfo;
- (AdInfo*) getAdInfo:(int) index;
- (NSArray*) getAdInfos;
- (int) getAdInfoCount;

@end
