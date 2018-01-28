//
//  DetailViewController.m
//  GiphyViewer
//
//  Created by Mohammed Al-Dahleh on 2018-01-28.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

#import "DetailViewController.h"
#import "Giphy.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.giphy) {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.giphy.animatedURL];
        [self.webView loadRequest:request];
        [self setupGestures];
    } else {
        [self dismiss];
    }
}

#pragma mark - Gestures

- (void)setupGestures {
    UITapGestureRecognizer *dismiss = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismiss)];
    dismiss.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:dismiss];
}

- (void)dismiss {
    [UIView animateWithDuration:0.75 animations:^{
        self.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
