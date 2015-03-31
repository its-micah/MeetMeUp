//
//  Comment.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/30/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "Comment.h"
#import "Event.h"

@implementation Comment

+ (NSArray *)objectsFromArray:(NSArray *)incomingArray {
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:incomingArray.count];

    for (NSDictionary *d in incomingArray) {
        Comment *e = [[Comment alloc]initWithDictionary:d];
        [newArray addObject:e];

    }
    return newArray;

}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {

        self.author = dictionary[@"member_name"];
        self.date = [Comment dateFromNumber:dictionary[@"time"]];
        self.text = dictionary[@"comment"];
        self.memberID = dictionary[@"member_id"];
    }
    return self;
}

+ (NSDate *) dateFromNumber:(NSNumber *)number
{
    NSNumber *time = [NSNumber numberWithDouble:([number doubleValue] )];
    NSTimeInterval interval = [time doubleValue];
    return  [NSDate dateWithTimeIntervalSince1970:interval];

}



@end
