//
//  ViewController.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/23/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "ViewController.h"
#import "EventDetailViewController.h"
#import "Event.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property NSDictionary *meetupDictionary;
@property (nonatomic)  NSArray *tableDataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property Event *selectedEvent;
@property EventDetailViewController *eventDVC;
@property NSDictionary *meetups;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSString *apiString;
@property BOOL isFiltered;
@property NSMutableArray *searchResults;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *navigationImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
    navigationImage.image = [UIImage imageNamed:@"logo-2x"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
    [titleImageView addSubview:navigationImage];
    self.navigationItem.titleView = titleImageView;
    navigationImage.contentMode = UIViewContentModeScaleAspectFill;


    [Event retrieveMeetupDataWithCompletion:^(NSArray *meetupArray) {
        self.tableDataArray = meetupArray;
    }];

    self.searchBar.delegate = self;
}

- (void)setTableDataArray:(NSArray *)tableDataArray {
    _tableDataArray = tableDataArray;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.isFiltered) {
        return self.searchResults.count;
    } else {
        return self.tableDataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Event *event = [self.tableDataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = event.eventName;
    cell.detailTextLabel.text = event.hostInfo;
    cell.imageView.image = [UIImage imageNamed:@"logo-2x"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    self.eventDVC = segue.destinationViewController;
    Event *selectedEvent = [self.tableDataArray objectAtIndex:indexPath.row];
    self.eventDVC.event = selectedEvent;
    NSLog(@"%@", selectedEvent.eventName);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

    if(searchText.length == 0) {
        self.isFiltered = NO;
    } else {
        self.isFiltered = YES;
        self.searchResults = [[NSMutableArray alloc] init];
                for (Event *event in self.tableDataArray) {
                    NSRange stopNameRange = [event.eventName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                    if (stopNameRange.location != NSNotFound) {
                        [self.searchResults addObject:event];
                    }
                }
    }

    [self.tableView reloadData];
}


@end
