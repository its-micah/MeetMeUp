//
//  WebViewController.m
//  MeetupAPI
//
//  Created by Micah Lanier on 3/23/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "WebViewController.h"
#import "EventDetailViewController.h"


@interface WebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self goToURL:[NSString stringWithFormat:@"%@", self.event.eventURL]];

}

- (void)goToURL:(NSString *)string {
    NSString *urlString = string;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

- (IBAction)onExitButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"You did it!");
    }];
}

- (IBAction)onBackButtonPressed:(id)sender {
    [self.webView goBack];
}


- (IBAction)onForwardButtonPressed:(id)sender {
    [self.webView goForward];
}



@end
