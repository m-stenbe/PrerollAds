//
//  Creatives.h
//  iOSAds
//
//  Created by Mikael on 30/10/14.
//  Copyright (c) 2014 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Linear;

@interface Creatives : NSObject {
    NSMutableArray* linears;
}

@property (copy) NSString* theId;

- (void) addLinears:(Linear*) linear;
- (Linear*) getLinear:(int) index;
- (int) getLinearCount;
- (NSArray*) getLinear;

@end
