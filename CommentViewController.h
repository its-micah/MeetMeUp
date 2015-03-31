//
//  CommentViewController.h
//  MeetupAPI
//
//  Created by Micah Lanier on 3/23/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "ViewController.h"
#import "Event.h"

@interface CommentViewController : ViewController

@property Event *event;
@property (nonatomic, strong) NSString *memberID;


@end
