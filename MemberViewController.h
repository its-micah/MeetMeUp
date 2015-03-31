//
//  MemberViewController.h
//  MeetupAPI
//
//  Created by Micah Lanier on 3/30/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "Member.h"

@interface MemberViewController : UIViewController

@property Event *event;
@property NSString *memberID;
@property Member *member;


@end
