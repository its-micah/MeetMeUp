//
//  Member.h
//  MeetupAPI
//
//  Created by Micah Lanier on 3/30/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member : NSObject

//@property (nonatomic, strong) NSString *memberID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSURL *photoURL;
@property (nonatomic, strong) NSString *commentMemberID;



- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)retrieveMeetUpPicURLWithCompletion:(void (^)(Member *member))complete;
+ (void)retrieveImageDataWithCompletion:(NSString *)commentMemberID withCompletionHandler:(void (^)(Member *member))complete;


@end
