//
//  Event.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/23/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "Event.h"
#import "Comment.h"

@implementation Event

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    NSDictionary *venue = [dictionary objectForKey:@"venue"];
    NSDictionary *group = [dictionary objectForKey:@"group"];
    self.eventName = dictionary[@"name"];
    self.rsvpCount = dictionary[@"yes_rsvp_count"];
    self.hostInfo = venue[@"name"];
    self.eventDescription = dictionary[@"description"];
    self.eventURL = dictionary[@"event_url"];
    self.groupID = group[@"id"];

    return self;
}


+ (void)retrieveMeetupDataWithCompletion:(void (^)(NSArray *meetupArray))complete {
    NSString *apiString = @"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=4d502876175d4d4c70222f84b5e392c";
    NSURL *url = [NSURL URLWithString:apiString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *masterDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSArray *results = masterDictionary[@"results"];
        NSMutableArray *events = [NSMutableArray new];

        for (NSDictionary *dict in results) {
            Event *event = [[Event alloc] initWithDictionary:dict];
            [events addObject:event];
        }
        complete(events);
    }];
}

- (void)retrieveMeetupDataWithCompletion:(void (^)(NSArray *commentsArray))complete {
    NSString *apiString = @"https://api.meetup.com/2/event_comments?&sign=true&photo-host=public&group_id=*******&page=20&key=4d502876175d4d4c70222f84b5e392c";
    NSString *urlString = [apiString stringByReplacingOccurrencesOfString:@"*******" withString:[self.groupID stringValue]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *masterDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSArray *results = masterDictionary[@"results"];
        NSMutableArray *comments = [NSMutableArray new];

        for (NSDictionary *dict in results) {
            Comment *comment = [[Comment alloc] initWithDictionary:dict];
            [comments addObject:comment];
        }
        complete(comments);
    }];
}




@end
