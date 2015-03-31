//
//  CommentViewController.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/23/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "CommentViewController.h"
#import "Comment.h"
#import "MemberViewController.h"

@interface CommentViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *comments;
@property NSDictionary *commentDictionary;
@property NSString *apiString;
@property (nonatomic)  NSArray *commentTableDataArray;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;



@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.event retrieveMeetupDataWithCompletion:^(NSArray *commentsArray) {
        self.commentTableDataArray = commentsArray;
    }];

}

- (void)setCommentTableDataArray:(NSArray *)commentTableDataArray {
    _commentTableDataArray = commentTableDataArray;
    [self.commentTableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.commentTableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    Comment *comment = [self.commentTableDataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = comment.author;
    cell.detailTextLabel.text = comment.text;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MemberViewController *memberVC = segue.destinationViewController;

    Comment *comment = self.commentTableDataArray[[self.commentTableView indexPathForSelectedRow].row];
    comment.memberID = memberVC.memberID;
}



@end
