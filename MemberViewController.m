//
//  MemberViewController.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/30/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "MemberViewController.h"
#import "Member.h"

@interface MemberViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation MemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", self.memberID);
    self.ImageView.layer.masksToBounds = YES;
//    self.ImageView.layer.cornerRadius = self.ImageView.bounds.size.width / 2.0;
    self.ImageView.layer.cornerRadius = 100;




    [Member retrieveImageDataWithCompletion:self.memberID withCompletionHandler:^(Member *member) {
        self.member = member;
        NSLog(@"data received");
        self.nameLabel.text = self.member.name;
        NSData *imageData = [NSData dataWithContentsOfURL:self.member.photoURL];
        self.ImageView.image = [UIImage imageWithData:imageData];
    }];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
