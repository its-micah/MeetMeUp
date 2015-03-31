//
//  Comment.h
//  MeetupAPI
//
//  Created by Micah Lanier on 3/30/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (nonatomic, strong) NSString *memberID;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *text;

+ (NSArray *)objectsFromArray:(NSArray *)incomingArray;
+ (NSDate *) dateFromNumber:(NSNumber *)number;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
