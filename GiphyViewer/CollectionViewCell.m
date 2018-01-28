//
//  CollectionViewCell.m
//  GiphyViewer
//
//  Created by Mohammed Al-Dahleh on 2018-01-28.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    
    [self dowloadImageWithURL:urlString];
}

- (void)dowloadImageWithURL:(NSString *)urlString {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    }];
    
    [task resume];
}

@end
