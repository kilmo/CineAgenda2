//
//  Filme.h
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/7/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filme : NSObject


@property NSString *name;
@property NSDate *launching;
@property NSString *imgUrl;

@property NSString *detailsUrl;
@property NSString *synopsis;
@property NSString *gender;
@property NSString *direction;
@property NSString *screenplay;
@property NSString *cast;
@property NSString *production;
@property NSString *photography;

@end
