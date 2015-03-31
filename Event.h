//
//  Event.h
//  MeetupAPI
//
//  Created by Micah Lanier on 3/23/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property NSString *eventName;
@property NSString *rsvpCount;
@property NSString *hostInfo;
@property NSString *eventDescription;
@property NSURL *eventURL;
@property NSNumber *groupID;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
//- (instancetype)initWithName:(NSString *)name withRSVPCount:(NSString *)count withHostInfo:(NSString *)hostInfo withEventDescription:(NSString *)eventDescription withURL:(NSURL *)url withGroupID:(NSNumber *)groupID;

+ (void)retrieveMeetupDataWithCompletion:(void (^)(NSArray *meetupArray))complete;
- (void)retrieveMeetupDataWithCompletion:(void (^)(NSArray *commentsArray))complete;



@end
