//
//  EventDetailViewController.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/23/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "EventDetailViewController.h"
#import "Event.h"
#import "WebViewController.h"
#import "CommentViewController.h"

@interface EventDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (weak, nonatomic) IBOutlet UILabel *hostInfoLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property NSNumber *groupID;
@property NSString *htmlFreeString;




@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.eventNameLabel.text = self.event.eventName;
    self.htmlFreeString = [self.event.eventDescription
                           stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    self.descriptionLabel.text = self.htmlFreeString;
    self.hostInfoLabel.text = self.event.hostInfo;
    self.groupID = self.event.groupID;

    self.rsvpLabel.text = [NSString stringWithFormat:@"%@", self.event.rsvpCount];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"WebPageSegue"]) {
        WebViewController *wvc = segue.destinationViewController;
        wvc.event = self.event;
    } else if ([segue.identifier isEqualToString:@"ShowCommentSegue"]) {
        CommentViewController *commentVC = segue.destinationViewController;
        commentVC.event = self.event;
        NSLog(@"%@", commentVC.event.groupID);
    }
}



@end
