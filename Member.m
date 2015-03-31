//
//  Member.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/30/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "Member.h"

@implementation Member


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    NSDictionary *photo = [dictionary objectForKey:@"photo"];
    self.commentMemberID = [dictionary objectForKey:@"id"];
    self.name = [dictionary objectForKey:@"name"];
    self.photoURL = [NSURL URLWithString:[photo objectForKey:@"photo_link"]];
    return  self;
}


- (void)retrieveMeetUpPicURLWithCompletion:(void (^)(Member *member))complete {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.meetup.com/2/member/%@?&sign=true&photo-host=public&page=20&key=4d502876175d4d4c70222f84b5e392c",self.commentMemberID]];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSDictionary *masterDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

                               Member *member = [[Member alloc]initWithDictionary:masterDictionary];
                               complete(member);
                           }];

}

+ (void)retrieveImageDataWithCompletion:(NSString *)commentMemberID withCompletionHandler:(void (^)(Member *member))complete {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.meetup.com/2/member/%@?&sign=true&photo-host=public&page=20&key=4d502876175d4d4c70222f84b5e392c", commentMemberID]];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        Member *member = [[Member alloc]initWithDictionary:dictionary];
        complete(member);

    }];
    
}


@end

